
import 'package:flutter/material.dart';

class CountryDetails extends StatelessWidget {
  CountryDetails({Key key, this.data}) : super(key: key);
  Map data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('${data['name']}',
          style: TextStyle(color: Colors.cyan,fontSize: 13),),
        centerTitle: true,
      ),
      body: ListView(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(data['emoji'], style: TextStyle(fontSize: 50),textAlign: TextAlign.center,),
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: ListView(
            children: [
              card(data['name'],"name"),
              card(data['native'],"native"),
              card(data['phone'],"phone"),
              card(data['continent'],"continent"),
              card(data['capital'],"capital"),
              card(data['currency'],"currency"),
              card(data['languages'],"languages"),
              card(data['emoji'],"emoji"),
              card(data['emojiU'],"emojiU"),
            ],
          ),
        ),
      ],
      ),
    );
  }

  Widget card( var name, String n) {
    return Container(
      child: Column(
        children:[
         ListTile(
        title: Text('$name', style: TextStyle(
            color: Colors.indigo,
            fontSize: 15,
            fontWeight: FontWeight.bold),),
            subtitle: Text("$n"),
      ),
],
    ));
  }
}


