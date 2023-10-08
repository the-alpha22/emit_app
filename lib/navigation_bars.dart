import 'package:emit_app/constants/constants.dart';
import 'package:emit_app/constants/controllers.dart';
import 'package:emit_app/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomBottonNavBar extends StatefulWidget {
  const CustomBottonNavBar({Key? key});

  @override
  State<CustomBottonNavBar> createState() => _CustomBottonNavBarState();
}

class _CustomBottonNavBarState extends State<CustomBottonNavBar> {
  @override
  Widget build(BuildContext context) {
    final currentroute = Get.currentRoute;
    return BottomAppBar(
        height: 80,
        child: Container(
          decoration: BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(
                color: Colors.black38.withOpacity(0.1),
                blurRadius: 2,
                spreadRadius: 0.2)
          ]),
          height: 60,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MaterialButton(
                  onPressed: () {
                    setState(() {
                      Get.offAllNamed("/home");
                    });
                  },
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(PhosphorIcons.house,
                            size: 32,
                            color: currentroute == "/home"
                                ? primaryColor
                                : Colors.black26),
                        SizedBox(height: 3),
                      ],
                    ),
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    setState(() {
                      Get.offAllNamed("/data-page");
                    });
                  },
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(PhosphorIcons.database,
                            size: 32,
                            color: currentroute == "/data-page"
                                ? primaryColor
                                : Colors.black26),
                        SizedBox(height: 3),
                      ],
                    ),
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    Get.offAllNamed("/visualize");
                  },
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(PhosphorIcons.eye,
                            size: 32,
                            color: currentroute == "/visualize"
                                ? primaryColor
                                : Colors.black26),
                        SizedBox(height: 3),
                      ],
                    ),
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    setState(() {
                      Get.offAllNamed("/my-account");
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(PhosphorIcons.user,
                          size: 32,
                          color: currentroute == "/my-account"
                              ? primaryColor
                              : Colors.black26),
                      SizedBox(height: 3),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

class CustomTopNavigationBar extends StatefulWidget {
  const CustomTopNavigationBar({Key? key});

  @override
  State<CustomTopNavigationBar> createState() => _CustomTopNavigationBarState();
}

class _CustomTopNavigationBarState extends State<CustomTopNavigationBar> {
  @override
  Widget build(BuildContext context) {
    final currentroute = Get.currentRoute;
    return Container(
      color: primaryColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  Get.to(HomePage(),
                      transition: Transition.fadeIn, routeName: "/home");
                });
              },
              child: Image.asset(
                'images/logotext.png',
                width: 150,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 25.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                      onTap: () {
                        Get.to(HomePage(),
                            transition: Transition.fadeIn, routeName: "/home");
                        // Get.offNamed("/home");
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.home,
                            size: 18,
                            color: currentroute == "/home"
                                ? Colors.white
                                : Colors.white.withOpacity(0.6),
                          ),
                          Text(
                            " Home",
                            style: GoogleFonts.montserrat(
                                color: currentroute == "/home"
                                    ? Colors.white
                                    : Colors.white.withOpacity(0.6),
                                fontWeight: FontWeight.w600,
                                fontSize: 14),
                          ),
                        ],
                      )),
                ),
                const SizedBox(
                  width: 25.0,
                ),
                InkWell(
                  onTap: () {
                    Get.offAllNamed("/data-page");
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      " Data ",
                      style: GoogleFonts.montserrat(
                          color: currentroute == "/data-page"
                              ? Colors.white
                              : Colors.white.withOpacity(0.6),
                          fontWeight: FontWeight.w600,
                          fontSize: 14),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 25.0,
                ),
                InkWell(
                  onTap: () {
                    Get.offAllNamed("/visualize");
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      " Visualize ",
                      style: GoogleFonts.montserrat(
                          color: currentroute == "/visualize"
                              ? Colors.white
                              : Colors.white.withOpacity(0.6),
                          fontWeight: FontWeight.w600,
                          fontSize: 14),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: PopupMenuButton<String>(
                itemBuilder: (BuildContext context) {
                  return <PopupMenuEntry<String>>[
                    PopupMenuItem<String>(
                      value: 'account',
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.purple,
                              shape: BoxShape.circle,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Center(
                                child: Text(
                                  userController.userModel.value!.name
                                      .substring(0, 1)
                                      .toUpperCase(),
                                  style: GoogleFonts.montserrat(
                                      color: Colors.black, fontSize: 25),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("${userController.userModel.value!.name}"),
                              Text('View Account Profile'),
                            ],
                          ),
                        ],
                      ),
                    ),
                    PopupMenuItem<String>(
                      value: 'logout',
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            'images/logout.svg',
                            height: 18,
                            color: Colors.black,
                          ),
                          Text('  Logout'),
                        ],
                      ),
                    ),
                  ];
                },
                onSelected: (String value) {
                  if (value == "logout") {
                    userController.signOut();
                    Get.offNamed("/authscreen");
                  } else {
                    setState(() {
                      Get.offNamed("/profile/$value");
                    });
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.purple,
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Center(
                      child: Text(
                        userController.userModel.value!.name
                            .substring(0, 1)
                            .toUpperCase(),
                        style: GoogleFonts.montserrat(
                            color: Colors.black, fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
