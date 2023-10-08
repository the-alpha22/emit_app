import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Get.offAllNamed("/login");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/splash.jpg"), fit: BoxFit.cover)),
        child: Center(
          child: Text("EMIT",
              style: GoogleFonts.averiaSansLibre(
                  color: Colors.white.withOpacity(0.9),
                  fontSize: 30,
                  fontWeight: FontWeight.w500)),
        ),
      ),
    );
  }
}
