import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/user_model.dart';

class ApiService {
  static const String baseUrl = "https://randomuser.me/api/?results=20";

  Future<UserModel> fetchUsers() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      return UserModel.fromJson(jsonDecode(response.body.toString()));
    } else {
      throw Exception("Failed to load users");
    }
  }

}
