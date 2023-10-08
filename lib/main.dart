import 'package:emit_app/constants/constants.dart';
import 'package:emit_app/controllers/auth_controller.dart';
import 'package:emit_app/controllers/data_page_controller.dart';
import 'package:emit_app/firebase_options.dart';
import 'package:emit_app/screens/authentication/login.dart';
import 'package:emit_app/screens/authentication/registration.dart';
import 'package:emit_app/screens/data/data_page.dart';
import 'package:emit_app/screens/home/home.dart';
import 'package:emit_app/screens/profile/profile.dart';
import 'package:emit_app/screens/visualize/visualize_page.dart';
import 'package:emit_app/waiting_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp();
    print("Firebase initialized successfully");
  } catch (e) {
    print("Error initializing Firebase: $e");
  }
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((value) {
    Get.put(UserController());
    Get.lazyPut(() => DataController());
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final currentRoute = Get.currentRoute;

    return GetMaterialApp(
      color: primaryColor,
      debugShowCheckedModeBanner: false,
      title: 'Emit',
      theme: ThemeData(primaryColor: primaryColor),
      initialRoute: currentRoute,
      getPages: [
        GetPage(
            name: '/',
            page: () => const WaitingScreen(),
            transition: Transition.fadeIn),
        GetPage(
            name: '/login',
            page: () => const LoginPage(),
            transition: Transition.fadeIn),
        GetPage(
            name: '/create-account',
            page: () => const RegisterationPage(),
            transition: Transition.fadeIn),
        GetPage(
            name: '/home',
            page: () => const HomePage(),
            transition: Transition.fadeIn),
        GetPage(
            name: '/visualize',
            page: () => const VisualizePage(),
            transition: Transition.fadeIn),
        GetPage(
            name: '/data-page',
            page: () => const DataPage(),
            transition: Transition.fadeIn),
        GetPage(
            name: '/my-account',
            page: () => const ProfilePage(),
            transition: Transition.fadeIn),
      ],
    );
  }
}
