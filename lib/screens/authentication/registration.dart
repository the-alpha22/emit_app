import 'package:emit_app/constants/constants.dart';
import 'package:emit_app/constants/controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterationPage extends StatefulWidget {
  const RegisterationPage({Key? key});

  @override
  State<RegisterationPage> createState() => _RegisterationPageState();
}

class _RegisterationPageState extends State<RegisterationPage> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  String? country;
  List<String> countries = ["Uganda", "Kenya", "Tanzania"];
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
                        "Create Account.",
                        style: GoogleFonts.poppins(
                            color: Colors.black.withOpacity(0.7),
                            fontSize: 30,
                            fontWeight: FontWeight.w700),
                      ),
                      TextButton(
                          onPressed: () {
                            Get.toNamed("/login");
                          },
                          child: Text("Have an account? Login",
                              style: GoogleFonts.poppins(
                                  color: Colors.black.withOpacity(0.5),
                                  fontSize: 14))),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            Container(
                              color: Color.fromARGB(255, 249, 253, 255),
                              child: TextFormField(
                                controller: userController.name,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  hintText: 'Name',
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
                                    return 'Name Required';
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
                            FormField(
                              builder: (FormFieldState state) {
                                return InputDecorator(
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 20.0, vertical: 15.0),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey.withOpacity(0.3)),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: primaryColor.withOpacity(0.4)),
                                    ),
                                  ),
                                  child: DropdownButtonHideUnderline(
                                    child: SingleChildScrollView(
                                      child: DropdownButton<String>(
                                          value: country,
                                          isDense: true,
                                          onChanged: (value) {
                                            setState(() {
                                              country = value;
                                            });
                                          },
                                          items: [
                                            DropdownMenuItem(
                                              value:
                                                  null, // Set the value to null for the hint
                                              child: Text(
                                                'Choose Country',
                                                style: GoogleFonts.montserrat(
                                                    color: Colors.black
                                                        .withOpacity(0.6),
                                                    fontSize: 14),
                                              ),
                                            ),
                                            ...countries.map((value) {
                                              return DropdownMenuItem(
                                                onTap: () {
                                                  setState(() {
                                                    country = value;
                                                  });
                                                },
                                                value: value,
                                                child: Text(value),
                                              );
                                            }).toList(),
                                          ]),
                                    ),
                                  ),
                                );
                              },
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
                                  if (_formKey.currentState!.validate() &&
                                      country != null) {
                                    userController.signUp(country!, context);
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
                                    "Create Account",
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
