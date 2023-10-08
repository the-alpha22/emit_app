import 'package:emit_app/constants/constants.dart';
import 'package:emit_app/constants/controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: ListView(
              children: [
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.19,
                      ),
                      Text("EMIT",
                          style: GoogleFonts.averiaSansLibre(
                              color: Colors.black.withOpacity(0.9),
                              fontSize: 30,
                              fontWeight: FontWeight.w500)),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Let's Login.",
                        style: GoogleFonts.poppins(
                            color: Colors.black.withOpacity(0.7),
                            fontSize: 30,
                            fontWeight: FontWeight.w700),
                      ),
                      TextButton(
                          onPressed: () {
                            Get.toNamed("/create-account");
                          },
                          child: Text("Don't have an account? Create one",
                              style: GoogleFonts.poppins(
                                  color: Colors.black.withOpacity(0.5),
                                  fontSize: 14))),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            // Add TextFormFields and ElevatedButton here.
                            Container(
                              color: Color.fromARGB(255, 249, 253, 255),
                              child: TextFormField(
                                controller: userController.email,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  hintText: 'Email Address',
                                  hintStyle: GoogleFonts.montserrat(
                                      color: Colors.black.withOpacity(0.6),
                                      fontSize: 14),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.grey.withOpacity(0.3)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: primaryColor.withOpacity(0.4)),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.red.withOpacity(0.4)),
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Email Required';
                                  } else if (value.length < 5) {
                                    return 'Enter a valid email';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              color: Color.fromARGB(255, 249, 253, 255),
                              child: TextFormField(
                                controller: userController.password,
                                keyboardType: TextInputType.text,
                                obscureText: true,
                                decoration: InputDecoration(
                                  hintText: 'Password',
                                  hintStyle: GoogleFonts.montserrat(
                                      color: Colors.black.withOpacity(0.6),
                                      fontSize: 14),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.grey.withOpacity(0.3)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: primaryColor.withOpacity(0.4)),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.red.withOpacity(0.4)),
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your password';
                                  } else if (value.length < 3) {
                                    return 'Please enter a valid password';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    textStyle: GoogleFonts.poppins(
                                        color: Colors.white, fontSize: 13),
                                    backgroundColor: primaryColor),
                                onPressed: () {
                                  // Validate returns true if the form is valid, or false otherwise.
                                  if (_formKey.currentState!.validate()) {
                                    userController.signIn(context);
                                  }
                                },
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.95,
                                  margin: EdgeInsets.all(15.0),
                                  padding: EdgeInsets.all(3.0),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Center(
                                      child: Text(
                                    "Login",
                                    style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
                                  )),
                                )),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                              onPressed: () {
                                // Get.to(() => ResetPassword(),
                                //     transition: Transition.rightToLeft);
                              },
                              child: Text("Forgot Password?",
                                  style: GoogleFonts.poppins(
                                      color: Colors.black.withOpacity(0.5),
                                      fontSize: 14))),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
