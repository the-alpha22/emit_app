import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  static const ID = "id";
  static const NAME = "name";
  static const EMAIL = "email";
  static const COUNTRY = "country";

  late String id;
  late String name;
  late String email;
  late String country;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.country,
  });

  UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    Map data = (snapshot.data() as Map<dynamic, dynamic>);
    name = data['name'];
    email = data['email'];
    country = data['country'];
    id = data['id'];
  }

  factory UserModel.fromMap(Map data) {
    return UserModel(
      name: data['name'],
      email: data['email'],
      country: data['country'],
      id: data['id'],
    );
  }
}
