import 'package:flutter/material.dart';
import 'package:demo_app/screens/joke_screen.dart';
import 'package:demo_app/screens/login-page/login_page.dart';
import 'package:demo_app/testing_text.dart';
import 'package:demo_app/screens/weather_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required title}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  static const List<Widget> _screenList =  [WeatherScreen(), JokeScreen(), TestingText()] ;

  _changeScreen(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return const LoginPage();
    // return Scaffold(
    //   primary: true,
    //   appBar: AppBar(
    //     title: const Text('Daya App Demo'),
    //   ),
    //   // body: ,
    //   body: _screenList.elementAt(_selectedIndex),
    //   bottomNavigationBar: BottomNavigationBar(
    //     items: const [
    //       BottomNavigationBarItem(
    //         icon: Icon(Icons.sunny),
    //         label: "Weather",
    //         backgroundColor: Colors.red
    //       ),
    //       BottomNavigationBarItem(
    //         icon: Icon(Icons.sentiment_satisfied_alt),
    //         label: "Joke",
    //         backgroundColor: Colors.red
    //       ),
    //     ],
    //     currentIndex: _selectedIndex,
    //     onTap: _changeScreen,
    //   )
    // );
  }
}
