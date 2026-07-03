import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiClient {
  final String baseUrl;

  ApiClient({required this.baseUrl});

  Future<http.Response> post(String url, Map<String, String> headers, dynamic body) async {
    final uri = Uri.parse(url);
    return await http.post(
      uri,
      headers: headers,
      body: jsonEncode(body),
    );
  }

  Future<http.Response> get(String url, Map<String, String> headers) async {
    final uri = Uri.parse(url);
    return await http.get(uri, headers: headers);
  }
}
