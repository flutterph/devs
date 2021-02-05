import 'package:devs/features/devboard/devboard_page.dart';
import 'package:devs/features/jobs/jobs_page.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => DashboardPageState();
}

class DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              InkWell(
                child: Text('DEVBOARD'),
                onTap: () {},
              ),
              InkWell(
                child: Text('JOBS'),
                onTap: () {},
              ),
            ],
          ),
          Container(
            height: 800,
            child: PageView(
              children: [
                DevboardPage(),
                JobsPage(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
