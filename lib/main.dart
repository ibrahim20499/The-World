
import 'dart:async';

import 'ThemeProvider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
import 'Presentation/Widgets/Continents.dart';
import 'Presentation/Screens/Favourite.dart';
import 'Data/Json/data.dart';
import 'ThemeProvider/change_theme.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
    create: (context) => ThemeProvider(),
    builder: (context, _) {
      final themeProvider = Provider.of<ThemeProvider>(context);
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: themeProvider.themeMode,
        theme: MyThemes.lightTheme,
        darkTheme: MyThemes.darkTheme,
        home: splash(),
      );
    },
  );
}


  class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class splash extends StatefulWidget {
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<splash> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 5),
            () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => MyHomePage())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Image.asset("assets/Wold.jpg", scale: 3.5,  ),
    );
  }
}

class _MyHomePageState extends State<MyHomePage> {

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  final List<Widget> _widgetOptions = [
    Continent(),
    Favourite(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Future<Map> dataCountry ;
  var db = Data();


  @override
  void initState() {
    super.initState();
    dataCountry = db.loadAllData_Countries() ;
  }
  int _counter = 0;

  List<String>list;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("World"),
        centerTitle: true,
        //backgroundColor: Theme.of(context).iconTheme.color,
      ),
      body:_widgetOptions[_selectedIndex],


      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorite',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Ibrahim Hassan",style: TextStyle(fontSize: 20),),
                ],
              ),
              currentAccountPicture: Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 200,
                      alignment: Alignment.center,
                      height: 200,
                      decoration: BoxDecoration(
                      ),
                      child: Center(
                        child: CircleAvatar(
                          backgroundColor: Colors.greenAccent[400],
                          radius: 100,
                          child: Text(
                            "I",
                            style: TextStyle(fontSize: 40.0,),
                          ),
                        ),
                      ),
                    ),],
                ),
              ),
            ),
            ListTile(
              title: Text("Dark Mode", style: TextStyle(),),
              trailing: ChangeThemeButtonWidget(),
              onTap: () {
              },
            ),
          ],
        ),
      ),
    );
  }
}
