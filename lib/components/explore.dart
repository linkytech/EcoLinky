import 'package:ecolinky/services/http_service.dart';
import 'package:flutter/material.dart';

class Explore extends StatefulWidget {
  const Explore({Key? key}) : super(key: key);

  @override
  createState() => _BuildListViewState();
}

class _BuildListViewState extends State {
  var tennants = [];

  getTennants() {
    HttpService.getTennants().then((response) {
      setState(() {
        tennants = List.from(response);
      });
    });
  }

  initState() {
    super.initState();
    getTennants();
  }

  @override
  build(context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: tennants.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(20, 50, 20, 50),
          child: ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
              alignment: Alignment.topCenter,
              fixedSize: MaterialStatePropertyAll<Size>(
                Size.fromHeight(300),
              ),
              elevation: MaterialStatePropertyAll<double>(0.0),
              shadowColor: MaterialStatePropertyAll<Color>(Colors.transparent),
              backgroundColor: MaterialStatePropertyAll<Color>(Colors.white),
              shape: MaterialStatePropertyAll<OutlinedBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              side: MaterialStatePropertyAll<BorderSide>(
                  BorderSide(width: 1, color: Colors.black)),
            ),
            child: Column(
              children: [
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                  ),
                  child: Image.asset(
                    'assets/images/eco512.png',
                    height: 75,
                  ),
                ),
                SizedBox(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 8.0, 0, 5.0),
                            child: Text(
                              tennants[index].name,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            tennants[index].description,
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
