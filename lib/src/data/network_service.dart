import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkService {
  Future<dynamic> get(String url) async {
    final response = await http.get(Uri.parse(url));
    return _processResponse(response);
  }

  Future<dynamic> post(String url, {Map<String, dynamic>? body}) async {
    final response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(body),
    );
    return _processResponse(response);
  }

  dynamic _processResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return json.decode(response.body);
      case 400:
        throw Exception('Bad request');
      case 401:
      case 403:
        throw Exception('Unauthorized');
      case 500:
      default:
        throw Exception('Error occurred with status code: ${response.statusCode}');
    }
  }
}
