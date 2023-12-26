import 'dart:io';
import 'dart:convert'; // Add this import for JSON encoding
import 'package:http/http.dart' as http;

class UploadService {
  Future<Map<String, dynamic>> uploadStory({
    required String judul,
    required String whatsapp,
    File? image,
    File? background,
    File? audio,
    File? selectFile,
    required String nama,
    required String email,
  }) async {
    try {
      String apiUrl = 'https://ceritarakyatsumbawa.com/api/upload';

      // Create a Map for headers
      Map<String, String> headers = {
        'Content-Type': 'application/json', // Change content type to JSON
        // Add any other headers you need
      };

      // Create a Map for the request body
      Map<String, dynamic> requestBody = {
        'judul': judul,
        'whatsapp': whatsapp,
        'nama': nama,
        'email': email,
      };

      // Encode the request body as JSON
      String encodedBody = json.encode(requestBody);

      print(encodedBody);

      // Create a request object
      var request = http.MultipartRequest('POST', Uri.parse(apiUrl))
        ..headers.addAll(headers);
        // ..fields['data'] = encodedBody;

      request.fields['judul'] = judul;
      request.fields['whatsapp'] = whatsapp;
      request.fields['nama'] = nama;
      request.fields['email'] = email;
      // Add files to the request if they are not null
      if (image != null) {
        request.files.add(await http.MultipartFile.fromPath('image', image.path));
      }
      if (background != null) {
        request.files.add(await http.MultipartFile.fromPath('background', background.path));
      }
      if (audio != null) {
        request.files.add(await http.MultipartFile.fromPath('audio', audio.path));
      }
      if (selectFile != null) {
        request.files.add(await http.MultipartFile.fromPath('select_file', selectFile.path));
      }

      // Send the request
      var response = await http.Response.fromStream(await request.send());

      if (response.statusCode == 200) {
        return {'success': true, 'message': 'Story uploaded successfully'};
      } else {
        return {'success': false, 'message': 'Error uploading story ${response.body}'};
      }
    } catch (error) {
      return {'success': false, 'message': 'An error occurred: $error'};
    }
  }
}
