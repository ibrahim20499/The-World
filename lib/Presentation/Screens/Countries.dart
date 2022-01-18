import 'package:flutter/material.dart';

import 'Country_Details.dart';
import '../../Data/Json/data.dart';
import '../Widgets/Continents.dart';

class Countries extends StatelessWidget {
  String name;

  Countries({Key key, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
        centerTitle: true,
        //backgroundColor: Theme.of(context).iconTheme.color,
      ),
      body: Container(
        child: FutureBuilder<Map>(
            future: Data().loadAllData_Countries(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<MapEntry> countries = snapshot.data.entries
                    .where((element) => element.value['continent'] == name)
                    .toList();
                return ListView.builder(
                    itemCount: countries == null ? 0 : countries.length,
                    itemBuilder: (BuildContext context, index) {
                      return Column(
                          children: [
                        GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CountryDetails(
                                            data: countries[index].value,
                                          )));
                            },
                            child: Center(
                              child: Container(
                                alignment: Alignment.centerLeft,
                                margin: EdgeInsets.all(6),
                                width: double.infinity,
                                padding: EdgeInsets.all(10),
                                height: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    color: Colors.indigo),
                                child: Text(
                                  '${countries[index].value['name'].toString()}',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            )),
                      ]);
                    });
              }
            }),
      ),
    );
  }

  void setState(Null Function() param0) {}
}

class Country extends StatefulWidget {
  @override
  _CountryState createState() => _CountryState();
}

class _CountryState extends State<Country> {
  Future<Map> dataCountry;

  var db = Data();

  @override
  void initState() {
    super.initState();
    dataCountry = db.loadAllData_Countries();
  }

  List<MapEntry> countries;

  @override
  Widget build(BuildContext context) {
    // return   // Padding(
    // padding: EdgeInsets.all(10),
    // child: TextField(
    //   decoration: InputDecoration(
    //     hintText: "Search",
    //   ),
    //   onChanged: (text) {
    //     text = text.toLowerCase();}
    //     // setState(() {
    //     //   countries=countries.where((country){
    //     //     var countryName = country.value['name'].toString().toLowerCase();
    //     //     return countryName.contains(text);
    //     //   }).toList();
    //     )),
  }
}
