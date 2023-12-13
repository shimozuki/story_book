import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:story_book/models/about_model.dart';

class AboutController {
  Future<AboutModel?> fetchData() async {
    final response = await http.get(Uri.parse('https://lombokfuntransport.com/back_office_story_book/api/get-about'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> dataList = data['data'];

      if (dataList.isNotEmpty) {
        return AboutModel.fromJson(dataList[0]);
      }
    }

    return null;
  }
}
