import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:story_book/models/detail_model.dart';

class DetailController {
  Future<DetailModel?> fetchData(int id) async {
    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      // Add any additional headers if required
    };

    final Map<String, dynamic> body = {
      'id': id.toString(),
      // Add any other parameters if required
    };

    final response = await http.post(
      Uri.parse('https://ceritarakyatsumbawa.com/api/get-byid'),
      headers: headers,
      body: jsonEncode(body),
    );

    print(response.body);

    if (response.statusCode == 200) {
      final dynamic data = json.decode(response.body);

      if (data is Map<String, dynamic> && data.containsKey('data')) {
        // Check if 'data' is a list
        if (data['data'] is List) {
          List<dynamic> dataList = data['data'];
          if (dataList.isNotEmpty) {
            // Handle list data accordingly, maybe iterate through it or handle each item individually
            return DetailModel.fromJson(dataList[0]);
          }
        } else if (data['data'] is Map<String, dynamic>) {
          // If 'data' is a map, proceed as before
          final Map<String, dynamic> dataMap = data['data'];

          if (dataMap.isNotEmpty) {
            return DetailModel.fromJson(dataMap);
          }
        }
      }
    }

    return null;
  }
}
