
import 'dart:convert';
import 'package:flutter/services.dart';

class Data {

  List data;
  Future<Map> loadName_Countries() async {
    final String response = await rootBundle.loadString('assets/data.json');
    Map user = json.decode(response);
    Map name = user["countries"]['name'];
    return name;
  }
  Future<Map> loadAllData_Countries() async {
    final String response = await rootBundle.loadString('assets/data.json');
    Map user = json.decode(response);
    Map name = user["countries"];

    return name;
  }

  Future<Map> loadAllData_Continents() async {
    final String response = await rootBundle.loadString('assets/data.json');
    Map user = json.decode(response);
    Map name = user["continents"];

    return name;
  }



}