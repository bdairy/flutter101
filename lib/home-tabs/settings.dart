import 'package:flutter/material.dart';

class SettingsTap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SwitchListTile(
          value: false,
          secondary: Icon(Icons.mood),
          onChanged: (bool val) {},
          title: Text('Dark Mode'),
          subtitle: Text('Switch to dark mode'),
        ),
        SwitchListTile(
          value: false,
          onChanged: (bool val) {
            
          },
          title: Text('Arabic'),
          subtitle: Text('Choose weather you want arabic or no'),
        )
      ],
    );
  }
}
