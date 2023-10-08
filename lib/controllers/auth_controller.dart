import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emit_app/constants/firebase.dart';
import 'package:emit_app/constants/loading.dart';
import 'package:emit_app/models/user.dart';
import 'package:emit_app/screens/authentication/first.dart';
import 'package:emit_app/screens/authentication/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  static UserController instance = Get.find();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController phone = TextEditingController();
  String usersCollection = "users";
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  Rxn<User> firebaseUser = Rxn<User>();
  Rxn<UserModel> userModel = Rxn<UserModel>();
  bool isLoggedIn = false;

  @override
  void onReady() async {
    //run every time auth state changes
    ever(firebaseUser, handleAuthChanged);

    firebaseUser.bindStream(user);

    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  handleAuthChanged(_firebaseUser) async {
    //get user data from firestore
    if (auth.currentUser != null) {
      userModel.bindStream(streamFirestoreUser());
      isLoggedIn = true;
    }

    if (auth.currentUser == null) {
      print('Send to signin');
      Get.offAll(() => FirstPage(), transition: Transition.rightToLeft);
    } else {
      Get.offAllNamed("/");
    }
  }

  // Firebase user one-time fetch
  Future<User> get getUser async => auth.currentUser!;

  // Firebase user a realtime stream
  Stream<User?> get user => auth.authStateChanges();

  //Streams the firestore user from the firestore collection
  Stream<UserModel> streamFirestoreUser() {
    print('streamFirestoreUser()');

    return _db
        .collection(usersCollection)
        .doc(firebaseUser.value!.uid)
        .snapshots()
        .map((snapshot) => UserModel.fromMap(snapshot.data()!));
  }

  //get the firestore user from the firestore collection
  Future<UserModel> getFirestoreUser() {
    return _db
        .collection(usersCollection)
        .doc(firebaseUser.value!.uid)
        .get()
        .then(
            (documentSnapshot) => UserModel.fromMap(documentSnapshot.data()!));
  }

  signIn(BuildContext context) async {
    showLoading();
    try {
      await auth
          .signInWithEmailAndPassword(
              email: email.text.trim(), password: password.text.trim())
          .then((result) {
        _clearControllers();
        dismissLoadingWidget();
      });
    } catch (e) {
      debugPrint(e.toString());
      dismissLoadingWidget();
      if (e.toString() ==
          "[firebase_auth/wrong-password] The password is invalid or the user does not have a password.") {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
                "The password you entered is incorrect. You can tap 'Forgot Password'"),
          ),
        );
      } else if (e.toString() ==
          "[firebase_auth/user-not-found] There is no user record corresponding to this identifier. The user may have been deleted.") {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
                "Seems like you are new here, please create an account first"),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Seems like you are offline. Please try again"),
          ),
        );
      }
    }
  }

  void signUp(String country, BuildContext context) async {
    showLoading();
    try {
      await auth
          .createUserWithEmailAndPassword(
              email: email.text.trim(), password: password.text.trim())
          .then((result) {
        String _userId = result.user!.uid;
        _addUserToFirestore(_userId, country);
        _clearControllers();
        dismissLoadingWidget();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Account Created Successfully"),
          ),
        );
      });
    } catch (e) {
      debugPrint(e.toString());
      dismissLoadingWidget();
      if (e.toString() ==
          "[firebase_auth/email-already-in-use] The email address is already in use by another account.") {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content:
                Text("The email address already has an account with Cuvend"),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Seems like you are offline. Try Again"),
          ),
        );
      }
    }
  }

  void resetpassword(BuildContext context) async {
    showLoading();
    try {
      await auth
          .sendPasswordResetEmail(email: email.text.trim())
          .then((result) {
        dismissLoadingWidget();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Reset link has been sent to ${email.text.trim()}"),
          ),
        );
        Get.offAll(() => LoginPage());
      });
    } catch (e) {
      debugPrint(e.toString());
      dismissLoadingWidget();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Something went wrong"),
        ),
      );
    }
  }

  void signOut() async {
    auth.signOut();
  }

  _addUserToFirestore(String userId, String country) {
    firebaseFirestore.collection(usersCollection).doc(userId).set({
      "name": name.text.trim(),
      "id": userId,
      "email": email.text.trim(),
      "country": country.toUpperCase(),
    });
  }

  _clearControllers() {
    name.clear();
    email.clear();
    password.clear();
    phone.clear();
  }

  updateUserData(Map<String, dynamic> data) {
    print("updated");
    firebaseFirestore
        .collection(usersCollection)
        .doc(firebaseUser.value!.uid)
        .update(data);
  }

  Stream<UserModel> listenToUser() => firebaseFirestore
      .collection(usersCollection)
      .doc(firebaseUser.value!.uid)
      .snapshots()
      .map((snapshot) => UserModel.fromSnapshot(snapshot));
}
