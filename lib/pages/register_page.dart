import 'package:flutter/material.dart';
import 'package:ecolinky/Models/user_model.dart';
import 'package:ecolinky/helpers/user_helper.dart';
import 'package:ecolinky/pages/home_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String _name = "";
  String _email = "";
  String _password = "";

  var userHelper = UserHelper();

  final frmRegisterKey = new GlobalKey<FormState>();

  void _closeRegister() async {
    Navigator.pop(context, true);
    var u = await userHelper.validateLogin(_email!, _password!);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => HomePage(user: u),
      ),
    );
  }

  void _registerUser() async {
    final form = frmRegisterKey.currentState;
    await userHelper.open();

    var u = await userHelper.validateLogin(_email!, _password!);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => HomePage(user: u),
      ),
    );

    if (form!.validate()) {
      form.save();

      var user = User(0, _name, _email, _password);
      user.id = await userHelper.saveUser(user);

      if (user.id > 0) {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Sucesso"),
              content: Text("Registro realizado com sucesso"),
            );
          },
        );
      } else {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Erro"),
              content: Text("Erro ao registrar usuário"),
            );
          },
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: frmRegisterKey,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 8,
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Registrar usuário",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 28,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        onSaved: (val) => _name = val.toString(),
                        decoration: InputDecoration(labelText: "Nome"),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        onSaved: (val) => _email = val.toString(),
                        decoration: InputDecoration(labelText: "E-mail"),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        obscureText: true,
                        onSaved: (val) => _password = val.toString(),
                        decoration: InputDecoration(labelText: "Senha"),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Senha deve ter no mínimo 6 caracteres!",
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Expanded(
                            child: Container(),
                          ),
                          TextButton(
                            child: Text("Registrar"),
                            onPressed: _registerUser,
                          ),
                          TextButton(
                            child: Text("Fechar"),
                            onPressed: _closeRegister,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
