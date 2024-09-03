import 'dart:convert';
import 'package:http/http.dart' as http;

Future<String> postUser(String userName) async {
  final url = Uri.parse('https://reqres.in/api/users');
  final requestBody = {
    "name": userName,
    "job": "leader"
  };
  final response = await http.post(
    url,
    headers: {"Content-Type": "application/json"},
    body: jsonEncode(requestBody),
  );

  if (response.statusCode == 201) {
    return response.body;
  } else {
    throw Exception('Status code: ${response.statusCode}');
  }
}


Future<Map<String, dynamic>> listUsers() async {
  final url = Uri.parse('https://reqres.in/api/users?page=1');

  final response = await http.get(
    url,
    headers: {"Content-Type": "application/json"},
  );

  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    throw Exception('Status code: ${response.statusCode.toString().substring(0,20)}.... (Check Your Connection)');
  }
}



