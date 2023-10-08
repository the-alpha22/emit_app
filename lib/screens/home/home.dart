import 'package:emit_app/constants/constants.dart';
import 'package:emit_app/navigation_bars.dart';
import 'package:emit_app/responsive.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<void> _openLink(String link) async {
    if (await canLaunch(link)) {
      await launch(link, webOnlyWindowName: "_blank");
    } else {
      throw 'Could not launch $link';
    }
  }

  @override
  Widget build(BuildContext context) {
    return !Responsive.isDesktop(context)
        ? Scaffold(
            appBar: AppBar(
              title: Text('Home',
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
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: primaryColor, width: 0.5)),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('What is EMIT?',
                                style: GoogleFonts.averiaSansLibre(
                                  color: Colors.black.withOpacity(0.9),
                                  fontSize: 18,
                                )),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                                'EMIT stands for Earth Surface Mineral Dust Source Investigation. It was developed by NASA’s Jet Propulsion Laboratory and launched on July 14th 2022. The EMIT mission studies the composition of surface minerals in earth’s arid regions, helping climate researchers to better understand the effect of dust on climate. Darker colored dust tends to absorb more energy from the sun, heating the surrounding air and intensifying global warming while lighter colored dust tends to reflect solar energy back into space thereby cooling the air around it.',
                                style: GoogleFonts.poppins(
                                  color: Colors.black.withOpacity(0.9),
                                  fontSize: 12,
                                )),
                            const SizedBox(
                              height: 10,
                            ),
                            InkWell(
                              onTap: () {
                                _openLink(
                                    "https://earth.jpl.nasa.gov/emit/mission/about/");
                              },
                              child: Container(
                                decoration:
                                    const BoxDecoration(color: primaryColor),
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Text('Learn More',
                                      style: GoogleFonts.averiaSansLibre(
                                        color: Colors.white.withOpacity(0.9),
                                        fontSize: 18,
                                      )),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: primaryColor, width: 0.5)),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('EMIT Now',
                                style: GoogleFonts.averiaSansLibre(
                                  color: Colors.black.withOpacity(0.9),
                                  fontSize: 18,
                                )),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                                'So far, EMIT has been used to identify the composition of Earth’s surface and how mineral dust influences global warming. Research has shown that dust can fertilize  rainforests and algae blooms while affecting the rate at which snow melts. EMIT is also helping to detect methane and carbon dioxide point source emissions to directly address greenhouse gas sources of climate change.',
                                style: GoogleFonts.poppins(
                                  color: Colors.black.withOpacity(0.9),
                                  fontSize: 12,
                                )),
                            const SizedBox(
                              height: 10,
                            ),
                            InkWell(
                              onTap: () {
                                _openLink(
                                    "https://earth.jpl.nasa.gov/emit/news-events/news/");
                              },
                              child: Container(
                                decoration:
                                    const BoxDecoration(color: primaryColor),
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Text('Learn More',
                                      style: GoogleFonts.averiaSansLibre(
                                        color: Colors.white.withOpacity(0.9),
                                        fontSize: 18,
                                      )),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: primaryColor, width: 0.5)),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('EMIT for the Future',
                                style: GoogleFonts.averiaSansLibre(
                                  color: Colors.black.withOpacity(0.9),
                                  fontSize: 18,
                                )),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                                'In addition to what EMIT has already accomplished, it has potential for use in other areas such as agricultural and vegetation monitoring, biodiversity, natural hazards, environmental pollution, and hazardous algal blooms.',
                                style: GoogleFonts.poppins(
                                  color: Colors.black.withOpacity(0.9),
                                  fontSize: 12,
                                )),
                            const SizedBox(
                              height: 10,
                            ),
                            InkWell(
                              onTap: () {
                                _openLink(
                                    "https://earth.jpl.nasa.gov/emit/applications/potential-applications/");
                              },
                              child: Container(
                                decoration:
                                    const BoxDecoration(color: primaryColor),
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Text('Learn More',
                                      style: GoogleFonts.averiaSansLibre(
                                        color: Colors.white.withOpacity(0.9),
                                        fontSize: 18,
                                      )),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: primaryColor, width: 0.5)),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Local Community Highlight',
                                style: GoogleFonts.averiaSansLibre(
                                  color: Colors.black.withOpacity(0.9),
                                  fontSize: 18,
                                )),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                                'Each week, we will highlight a local community that has been adversely affected by Greenhouse Gas emissions produced by the Superemitters identified by EMIT app data.',
                                style: GoogleFonts.poppins(
                                  color: Colors.black.withOpacity(0.9),
                                  fontSize: 12,
                                )),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                  ],
                ),
              ),
            )),
            bottomNavigationBar: const CustomBottonNavBar(),
          )
        : Scaffold(
            body: SafeArea(
                child: SingleChildScrollView(
              child: Column(
                children: [CustomTopNavigationBar()],
              ),
            )),
          );
  }
}
