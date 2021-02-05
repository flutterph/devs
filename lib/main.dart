import 'package:devs/features/dashboard/dashboard_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(DevsApp());
}

class DevsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Devs App by Flutter Philippines',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: DashboardPage(),
    );
  }
}
