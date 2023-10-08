import 'package:emit_app/constants/constants.dart';
import 'package:emit_app/navigation_bars.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class VisualizePage extends StatefulWidget {
  const VisualizePage({Key? key});

  @override
  State<VisualizePage> createState() => _VisualizePageState();
}

class _VisualizePageState extends State<VisualizePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Visualize',
            style: GoogleFonts.averiaSansLibre(
              color: Colors.white.withOpacity(0.9),
              fontSize: 20,
            )),
        elevation: 0,
        backgroundColor: primaryColor,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Center(
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.8,
            child: const HtmlWidget(
              '''
        <iframe width="100%" height="70%" src="https://earth.jpl.nasa.gov/emit/data/data-portal/coverage-and-forecasts/"></iframe>
        ''',
            ),
          ),
        ),
      )),
      bottomNavigationBar: const CustomBottonNavBar(),
    );
  }
}
