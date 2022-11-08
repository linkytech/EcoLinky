import 'package:flutter/Material.dart';

class Explore extends StatelessWidget {
  const Explore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 50, 20, 50),
      child: Container(
        height: 130,
        decoration: BoxDecoration(
          color: Colors.lightGreen,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(50),
            bottomRight: Radius.circular(50),
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
        ),
        child: Column(
          children: [
            Container(
              child: Image.asset(
                'assets/icons/icon.png',
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.10,
              ),
            ),
            SizedBox(
              child: Column(
                children: [
                  Row(
                    children: [
                      Text("Nome do local")
                    ],
                  ),
                  Row(
                    children: [
                      Text("Localização")
                    ],
                  ),
                  Row(
                    children: [
                      Text("Distancia")
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
