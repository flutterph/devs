import 'package:flutter/material.dart';

class JobsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _JobsPageState();
}

class _JobsPageState extends State<JobsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('Jobs'),
        ],
      ),
    );
  }
}
