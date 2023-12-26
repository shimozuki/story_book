import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:story_book/models/cerita_model.dart';

class CeritaController {
  final String apiUrl = 'https://ceritarakyatsumbawa.com/api/get-all';

  Future<List<CeritaModel>> fetchCeritaData() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body)['data'];
      return jsonData.map((item) => CeritaModel.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }
}
