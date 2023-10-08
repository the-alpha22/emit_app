import 'package:emit_app/constants/constants.dart';
import 'package:emit_app/controllers/data_page_controller.dart';
import 'package:emit_app/navigation_bars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class DataPage extends StatefulWidget {
  const DataPage({Key? key});

  @override
  State<DataPage> createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  var startDateparse;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data',
            style: GoogleFonts.averiaSansLibre(
              color: Colors.white.withOpacity(0.9),
              fontSize: 20,
            )),
        elevation: 0,
        backgroundColor: primaryColor,
        actions: [
          InkWell(
            onTap: () {
              addFilter();
            },
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.filter_alt,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              FutureBuilder<List<dynamic>>(
                future: DataController.instance.fetchData(startDateparse),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  }
                  List<dynamic>? data = snapshot.data;
                  if (data!.isEmpty) {
                    return Center(
                        child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 100,
                        ),
                        SvgPicture.asset(
                          'images/not found.svg',
                          height: MediaQuery.of(context).size.width * 0.75,
                        ),
                        Text(
                          "Nothing found",
                          style: GoogleFonts.montserrat(
                              color: Colors.black.withOpacity(0.6),
                              fontWeight: FontWeight.w500,
                              fontSize: 15),
                        ),
                      ],
                    ));
                  }
                  return GridView(
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 2,
                      crossAxisSpacing: 2,
                      childAspectRatio: 0.55,
                    ),
                    children: data.map((dataDetail) {
                      return Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(4),
                            border:
                                Border.all(color: primaryColor, width: 0.5)),
                        child: Text("${dataDetail["title"]}"),
                      );
                    }).toList(),
                  );
                },
              ),
            ],
          ),
        ),
      )),
      bottomNavigationBar: const CustomBottonNavBar(),
    );
  }

  DateTime? startDate;
  TimeOfDay? startTime;

  DateTime? endDate;
  TimeOfDay? endTime;
  String timePeriod = "Anytime";
  List<String> timePeriods = ["Anytime", "Day", "Night", "Both"];

  addFilter() {
    showModalBottomSheet<void>(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return Align(
            alignment: Alignment.bottomRight,
            child: SafeArea(
              child: SingleChildScrollView(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Form(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  icon: const Icon(
                                    Icons.arrow_back_ios,
                                    size: 14,
                                    color: Colors.black,
                                  )),
                              Text(
                                "  Select Filters",
                                style: GoogleFonts.montserrat(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          Text(
                            "Temporal",
                            style: GoogleFonts.montserrat(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 16),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  keyboardType: TextInputType.text,
                                  readOnly: true,
                                  onTap: () async {
                                    setState(() async {
                                      startDate = await showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime.now(),
                                          lastDate: DateTime(2060));
                                      if (startDate != null) {
                                        setState(() {});
                                        startTime = await showTimePicker(
                                            context: context,
                                            initialTime: TimeOfDay.now());
                                      }
                                    });
                                    setState(() {});
                                  },
                                  decoration: InputDecoration(
                                    suffixIcon: const Icon(
                                      Icons.timelapse,
                                      color: Colors.black45,
                                    ),
                                    hintText: startDate == null
                                        ? 'Enter Start Date'
                                        : "${startDate!.day}/${startDate!.month}/${startDate!.year}",
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
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                child: TextFormField(
                                  keyboardType: TextInputType.text,
                                  readOnly: true,
                                  onTap: () async {
                                    setState(() async {
                                      endDate = await showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime.now(),
                                          lastDate: DateTime(2060));
                                      if (endDate != null) {
                                        setState(() {});
                                        endTime = await showTimePicker(
                                            context: context,
                                            initialTime: TimeOfDay.now());
                                      }
                                    });
                                    setState(() {});
                                  },
                                  decoration: InputDecoration(
                                    suffixIcon: const Icon(
                                      Icons.timelapse,
                                      color: Colors.black45,
                                    ),
                                    hintText: endDate == null
                                        ? 'Enter End Date'
                                        : "${endDate!.day}/${endDate!.month}/${endDate!.year}",
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
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          Text(
                            "Day/Night",
                            style: GoogleFonts.montserrat(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 16),
                          ),
                          FormField(
                            builder: (FormFieldState state) {
                              return InputDecorator(
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
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
                                        value: timePeriod,
                                        isDense: true,
                                        onChanged: (value) {
                                          setState(() {
                                            timePeriod = value!;
                                          });
                                        },
                                        items: [
                                          ...timePeriods.map((value) {
                                            return DropdownMenuItem(
                                              onTap: () {
                                                setState(() {
                                                  timePeriod = value;
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
                          const SizedBox(
                            height: 24,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 2,
                                child: Material(
                                  borderRadius: BorderRadius.circular(9),
                                  color: bgcolor,
                                  child: InkWell(
                                    onTap: () async {
                                      Get.back();
                                    },
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0, vertical: 12),
                                        child: Text(
                                          'Cancel',
                                          style: GoogleFonts.poppins(
                                              color:
                                                  Colors.black.withOpacity(0.9),
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                flex: 3,
                                child: Material(
                                  borderRadius: BorderRadius.circular(9),
                                  color: primaryColor,
                                  child: InkWell(
                                    onTap: () async {},
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0, vertical: 12),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            const Icon(
                                              Icons.check,
                                              color: Colors.white,
                                              size: 14,
                                            ),
                                            Text(
                                              ' Add Filter',
                                              style: GoogleFonts.poppins(
                                                  color: Colors.white
                                                      .withOpacity(0.9),
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 14),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ));
      },
    );
  }
}
