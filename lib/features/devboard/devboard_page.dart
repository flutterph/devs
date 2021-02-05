import 'package:devs/features/devboard/devs/devs_list.dart';
import 'package:flutter/material.dart';

class DevboardPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DevboardPageState();
}

class _DevboardPageState extends State<DevboardPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Row(
            children: [
              Container(
                width: size.width * 0.25,
                height: 1000,
                color: Colors.black,
              ),
              Container(
                width: size.width * 0.65,
                height: 1000,
                child: DevsList(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
