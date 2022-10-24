import 'package:flutter/material.dart';
import 'package:teste/helpers/user_helper.dart';
import 'package:teste/pages/home_page.dart';
import 'package:teste/pages/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextStyle style = const TextStyle(fontSize: 20);

  String? _email = "";
  String? _password = "";

  var userHelper = UserHelper();

  final frmLoginKey = new GlobalKey<FormState>();

  void _validarLogin() async {
    await userHelper.open();
    final form = frmLoginKey.currentState;

    if (form!.validate()) {
      form.save();

      var u = await userHelper.validateLogin(_email!, _password!);

      if (u != null) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => HomePage(user: u)));
      } else {
        showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(
              title: Text("Erro durante login"),
              content: Text("Usuário ou senha incorretos"),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
            );
          },
        );
      }
    }
  }

  openRegister() {
    showDialog(context: context, builder: (context) => RegisterPage());
  }

  @override
  Widget build(BuildContext context) {
    final emailField = TextFormField(
      style: style,
      onSaved: (value) => _email = value,
      validator: (value) {
        return value!.length < 15
            ? "Email deve possuir no minimo 15 caracteres"
            : null;
      },
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          labelText: "E-Mail",
          suffixIcon: Icon(Icons.login),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32))),
    );
    final passwordField = TextFormField(
      obscureText: true,
      style: style,
      onSaved: (value) => _password = value,
      validator: (value) {
        return value!.length < 6 ? "Senha Inválida" : null;
      },
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        labelText: "Senha",
        suffixIcon: Icon(Icons.password),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
        ),
      ),
    );
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            height: MediaQuery.of(context).size.height,
            color: Colors.greenAccent,
            child: Padding(
              padding: const EdgeInsets.all(36),
              child: Form(
                key: frmLoginKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                        height: 155,
                        child: Image.asset('assets/images/splash.png')),
                    const SizedBox(
                      height: 45,
                    ),
                    emailField,
                    const SizedBox(
                      height: 25,
                    ),
                    passwordField,
                    const SizedBox(
                      height: 35,
                    ),
                    ElevatedButton(
                      onPressed: _validarLogin,
                      child: Text("Login", style: style),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextButton(
                      onPressed: openRegister,
                      child: const Text(
                        "Registrar",
                        style: TextStyle(fontSize: 25, color: Colors.orange),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
