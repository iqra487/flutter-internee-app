import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:myapp/data/user_model.dart';

Future<List<User>> fetchUsers() async {
  var url = Uri.parse('https://reqres.in/api/users?page=2');
  var response = await http.get(url);

  if (response.statusCode == 200) {
    Map<String, dynamic> json = jsonDecode(response.body);
    List<dynamic> data = json['data'];
    List<User> users = data.map((userJson) => User.fromJson(userJson)).toList();
    return users;
  } else {
    throw Exception('Failed to load users');
  }
}
