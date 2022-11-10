import 'dart:async';
import 'dart:convert';
import 'package:ecolinky/Models/tennant_model.dart';
import 'package:ecolinky/Models/user_model.dart';
import 'package:http/http.dart';

class HttpService {
  static final String baseUrl = "http://192.168.21.1:3333";

  static Future<List<Tennant>> getTennants() async {
    Response res = await get(Uri.parse(baseUrl + "/tennants"));

    if (res.statusCode == 200) {
      print("cheguei aqui");
      List<dynamic> body = jsonDecode(res.body);
      print(body);
      List<Tennant> tennants = body
          .map(
            (dynamic item) => Tennant.fromJson(item),
          )
          .toList();
      print("agr to aqui");
      return tennants;
    } else {
      print("ola");
      throw "Erro ao recuperar promoções!";
    }
  }

  static Future<String> createUser(User user) async {
    Response res = await post(
      Uri.parse(baseUrl + "/users"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(user.toMap()));

    if (res.statusCode == 201) {
      return "User created!";
    } else {
      throw "Error creating user!";
    }
  }
}
