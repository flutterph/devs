import 'package:flutter/material.dart';

class DevboardPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => DevboardPageState();
}

class DevboardPageState extends State<DevboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('Devboard'),
        ],
      ),
    );
  }
}
