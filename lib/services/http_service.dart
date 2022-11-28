import 'dart:async';
import 'dart:convert';
import 'package:ecolinky/Models/tennant_model.dart';
import 'package:ecolinky/Models/user_model.dart';
import 'package:http/http.dart';

class HttpService {
  //static final String baseUrl = "http://187.45.102.25:3333/api";
  static final String baseUrl = "http://192.168.21.1:3333/api";
  static Future<List<Tennant>> getTennants() async {
    Response res = await get(
      Uri.parse(baseUrl + "/tennant"),
    );

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<Tennant> tennants = body
          .map(
            (dynamic item) => Tennant.fromJson(item),
          )
          .toList();
      return tennants;
    } else {
      throw "Erro ao recuperar tennants!";
    }
  }

  static Future<String> createUser(User user) async {
    Response res = await post(Uri.parse(baseUrl + "/user"),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(user.toMap()));
    print("res ${res}");
    if (res.statusCode == 200) {
      return "User created!";
    } else {
      throw "Error creating user!";
    }
  }
}
