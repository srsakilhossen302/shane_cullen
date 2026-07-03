import 'package:http/http.dart' as http;

class ApiCheck {
  static bool isSuccess(http.Response response) {
    return response.statusCode >= 200 && response.statusCode < 300;
  }
}
