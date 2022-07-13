import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

import 'config_joke.dart';

class JokeScreen extends StatefulWidget {
  const JokeScreen({Key? key}) : super(key: key);

  @override
  State<JokeScreen> createState() => _JokeScreenState();
}

class _JokeScreenState extends State<JokeScreen> {
  String _joke = '';

  @override
  void initState() {
    super.initState();
    _getJoke();
  }

  Future<String> fetchJoke() async {
    var url = Uri.https('v2.jokeapi.dev', '/joke/Any', {'type': 'single'});
    final response = await http.get(url);
    final responseBody =
        convert.jsonDecode(response.body) as Map<String, dynamic>;
    return responseBody['joke'];
  }

  void _getJoke() async {
    String tempJoke = await fetchJoke();
    setState(() {
      _joke = tempJoke;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          //const Text(''),
          Padding(
            padding: const EdgeInsets.all(50),
            child: Text(
              _joke,
              style: const TextStyle(
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          ElevatedButton(onPressed: _getJoke, child: const Text('Get Joke')),
          TextButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ConfigJoke()));
            },
            child: const Text('Configuer Joke'),
          )
        ],
      ),
    );
  }
}
