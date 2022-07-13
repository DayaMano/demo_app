import 'package:demo_app/utility/title_text.dart';
import 'package:flutter/material.dart';

class ConfigJoke extends StatefulWidget {
  const ConfigJoke({Key? key}) : super(key: key);

  @override
  State<ConfigJoke> createState() => _ConfigJokeState();
}

class _ConfigJokeState extends State<ConfigJoke> {
  @override
  Widget build(BuildContext context) {
    String? selectedValue;
    List<DropdownMenuItem<String>> menuItem = const [
      DropdownMenuItem(
        value: "India",
        child: Text('INDIA'),
      ),
      DropdownMenuItem(
        value: "China",
        child: Text('CHINA'),
      ),
      DropdownMenuItem(
        value: "Japanese",
        child: Text('JAPANESE'),
      )
    ];

    return Scaffold(
      primary: true,
      appBar: AppBar(
        title: const Text('Config Joke'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleText(text: 'text'),
            DropdownButtonFormField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Theme.of(context).primaryColor, width: 2),
                  borderRadius: BorderRadius.circular(10),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).primaryColor,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                filled: true,
                fillColor: Theme.of(context).secondaryHeaderColor,
              ),
              validator: (value) => value == null ? 'Select value' : null,
              value: selectedValue,
              onChanged: (String? newValue) =>
                  setState(() => selectedValue = newValue!),
              items: menuItem,
            ),
          ],
        ),
      ),
    );
  }
}
