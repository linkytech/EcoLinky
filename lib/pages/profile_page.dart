import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          FlutterI18n.translate(context, "screen under construction"),
        ),
      ),
    );
  }
}
