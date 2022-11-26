import 'package:flutter/material.dart';
import 'package:ecolinky/helpers/user_helper.dart';
import 'package:ecolinky/pages/home_page.dart';
import 'package:ecolinky/pages/register_page.dart';
import 'package:flutter_i18n/flutter_i18n.dart';

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
            return AlertDialog(
              title: Text(FlutterI18n.translate(context, "error_login")),
              content:
                  Text(FlutterI18n.translate(context, "error_mesage_login")),
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
            ? FlutterI18n.translate(context, "error_email")
            : null;
      },
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          labelText: FlutterI18n.translate(context, "email"),
          suffixIcon: Icon(Icons.login),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32))),
    );
    final passwordField = TextFormField(
      obscureText: true,
      style: style,
      onSaved: (value) => _password = value,
      validator: (value) {
        return value!.length < 6
            ? FlutterI18n.translate(context, "password_invalid")
            : null;
      },
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        labelText: FlutterI18n.translate(context, "password"),
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
            color: Colors.white,
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
                        child: Image(
                          image: AssetImage('assets/images/eco512.png'),
                        )),
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
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Color.fromARGB(255, 0, 217, 83))),
                      child: Text(
                        FlutterI18n.translate(context, "login"),
                        style: style,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextButton(
                      onPressed: openRegister,
                      child: Text(
                        FlutterI18n.translate(context, "register"),
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
