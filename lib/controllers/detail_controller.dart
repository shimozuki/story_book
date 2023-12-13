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
      Uri.parse('https://lombokfuntransport.com/back_office_story_book/api/get-byid'),
      headers: headers,
      body: jsonEncode(body),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final Map<String, dynamic> dataMap = data['data'];

      if (dataMap.isNotEmpty) {
        return DetailModel.fromJson(dataMap);
      }
    }

    return null;
  }
}
