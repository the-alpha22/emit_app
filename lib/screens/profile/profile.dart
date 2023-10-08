import 'package:emit_app/constants/constants.dart';
import 'package:emit_app/constants/controllers.dart';
import 'package:emit_app/navigation_bars.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile',
            style: GoogleFonts.averiaSansLibre(
              color: Colors.white.withOpacity(0.9),
              fontSize: 20,
            )),
        elevation: 0,
        backgroundColor: primaryColor,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4)),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      ClipOval(
                        child: Container(
                          color: primaryColor,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text(
                                userController.userModel.value!.name
                                    .substring(0, 1)
                                    .toUpperCase(),
                                style: GoogleFonts.averiaSansLibre(
                                  color: Colors.white.withOpacity(0.9),
                                  fontSize: 20,
                                )),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text("${userController.userModel.value!.name.capitalize}",
                          style: GoogleFonts.averiaSansLibre(
                            color: Colors.black.withOpacity(0.9),
                            fontSize: 16,
                          )),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Center(
                child: InkWell(
                  onTap: () {
                    userController.signOut();
                  },
                  child: Text("Log Out",
                      style: GoogleFonts.averiaSansLibre(
                        color: Colors.red.withOpacity(0.9),
                        fontSize: 16,
                      )),
                ),
              ),
            ],
          ),
        ),
      )),
      bottomNavigationBar: CustomBottonNavBar(),
    );
  }
}
