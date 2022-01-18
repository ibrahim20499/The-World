import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Countries.dart';
import '../../main.dart';
import '../../Data/Json/data.dart';
class Country extends StatefulWidget {
  @override
  _CountryState createState() => _CountryState();
}
class _CountryState extends State<Country> {
  Future<Map> dataCountry ;
  var db = Data();

  @override
  void initState() {
    super.initState();
    dataCountry = db.loadAllData_Countries() ;
  }
  List<MapEntry> countries ;
  @override
  Widget build(BuildContext context) {
   return Padding(
     padding: EdgeInsets.all(10),
     child: TextField(
       decoration: InputDecoration(
         hintText: "Search",
       ),
       onChanged: (text) {
         text = text.toLowerCase();
         setState(() {
           countries=countries.where((country){
             var countryName = country.value['name'].toString().toLowerCase();
             return countryName.contains(text);
         }).toList();
         });
       },
     ),
   );
  }

}