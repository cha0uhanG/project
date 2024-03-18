import 'dart:convert';
import 'package:http/http.dart' as http;

class APIService {
  static Future<List<dynamic>> fetchTodos() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load todos');
    }
  }
}
