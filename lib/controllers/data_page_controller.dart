import 'dart:async';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class DataController extends GetxController {
  static DataController instance = Get.find();

  @override
  onReady() {
    super.onReady();
  }

  Future<List> fetchData(var startDate) async {
    try {
      startDate = startDate ?? "";
      var body = jsonEncode({
        "echo_collection_id": "C2408009906-LPCLOUD",
        "page_num": 1,
        "page_size": 20,
        "temporal": "2021-01-01T00:00:00.000Z",
        "sort_key": "-start_date",
      });

      final response = await http.post(
          Uri.parse("https://cmr.earthdata.nasa.gov/search/granules.json"),
          headers: {
            'Content-Type': 'application/json',
          },
          body: body);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        final List<dynamic> records = data['feed']["entry"];
        if (records.isEmpty) {
          print('No data');
          return [];
        } else {
          return records;
        }
      } else {
        // Handle API error
        print('API request failed with status ${response.statusCode}');
        print(response.body);
        return [];
      }
    } catch (e) {
      // Handle any other errors
      print('Error fetching data: $e');
      return [];
    }
  }
}
