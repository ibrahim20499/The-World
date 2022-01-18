import 'package:flutter/material.dart';
import 'Countries.dart';
import '../Widgets/Continents.dart';

class Favourite extends StatelessWidget {
  // String name;
  //
  // Favourite({Key key, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        // child: FutureBuilder<Map>(
        //     future: Data().loadAllData_Countries(),
        //     builder: (context, snapshot) {
        //         return ListView(
        //           children: List.generate(countries.length, (index) {
        //             return GestureDetector(
        //               onTap: () {
        //                 Navigator.of(context)
        //                     .push(MaterialPageRoute(builder: (BuildContext context) {
        //                   Iterable<String> list = snapshot.data.keys;
        //                   {
        //                     return ListTile(
        //                         title: Text('${countries[index].value['name'].toString()}',
        //                             style: TextStyle(fontSize: 16.0)));
        //                   }}));
        //               },
        //             )
        //             ,
        //           }
        //           ),
        //         )
        //     }
        // )
    );
  }
    }
