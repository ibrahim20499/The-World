import 'dart:core';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Screens/Countries.dart';
import '../../Data/Json/data.dart';

class Continent extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<Continent> {
  String image1 = "assets/images.jpeg";
  String image2 = "assets/Europe.PNG";
  String image3 = "assets/Austrilia.PNG";

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<Map<dynamic, dynamic>>(
          future: Data().loadAllData_Continents(),
          builder: (context, snapshot) {
            if (snapshot.data != null) {
              Iterable<String> list = snapshot.data.keys;
              return GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                padding: EdgeInsets.all(10),
                children: List.generate(snapshot.data.length, (index) {
                    return
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.black, width: 4),
                                borderRadius: BorderRadius.circular(25.0),
                                color: Colors.white),
                            alignment: Alignment.center,
                            child: Center(
                              child: ListTile(
                                title: ClipRRect(
                                  child: Image.asset(
                                    image1,
                                    fit: BoxFit.fitWidth,
                                  ),
                                  borderRadius: BorderRadius.circular(25.0),
                                ),
                                subtitle: Text(
                                  snapshot.data.values.elementAt(index).toString(),
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Countries(
                                        name: list.elementAt(index),
                                      ),
                                    ),
                                  );
                                },
                                // GestureDetector(
                              ),
                            ),
                    );
                  }),
            );
            }
          }),
    );
  }

  Widget card(var name, var image) {
    return Container(
        child: Column(children: [
      Text(
        '$name',
        style: TextStyle(
            color: Colors.indigo, fontSize: 15, fontWeight: FontWeight.bold),
      ),
    ]));
  }

  Widget cards(image, var text) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 4),
          borderRadius: BorderRadius.circular(25.0),
          color: Colors.white),
      alignment: Alignment.center,
      child: Center(
        child: ListTile(
          title: ClipRRect(
            child: Image.asset(
              '$image',
              fit: BoxFit.fitWidth,
            ),
            borderRadius: BorderRadius.circular(25.0),
          ),
          subtitle: Text(
            '$text',
            style: TextStyle(
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          // GestureDetector(
        ),
      ),
    );
  }
}

class Choice {
  const Choice({this.image});

  final String image;
}
