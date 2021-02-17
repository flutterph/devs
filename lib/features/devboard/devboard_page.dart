import 'package:devs/core/models/dev.dart';
import 'package:devs/features/devboard/devboard_model.dart';
import 'package:devs/features/devboard/devs/devs_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../dashboard/dashboard_model.dart';
import 'devs/devs_list.dart';

class DevboardPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DevboardPageState();
}

class _DevboardPageState extends State<DevboardPage> {
  DashboardModel dashboard;

  @override
  void didChangeDependencies() {
    dashboard = Provider.of<DashboardModel>(
      context,
      listen: false,
    );
    dashboard.getDevs();

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Selector<DashboardModel, List<Dev>>(
          selector: (_, dashboardModel) => dashboardModel.tempSearch,
          builder: (_, data, __) => DevsList(
            devs: data,
          ),
        ),
      ),
    );
  }
}
