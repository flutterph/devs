import 'package:devs/core/models/dev.dart';
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
  DevBoardModel devBoardModel;

  @override
  void didChangeDependencies() {
    devBoardModel = Provider.of(context, listen: false);

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: StreamBuilder<List<Dev>>(
          initialData: [],
          stream: devBoardModel.devsStream,
          builder: (context, data) {
            // TODO: Show a progress bar while data is null i.e loading data
            return DevsList(devs: data?.data ?? []);
          },
        ),
      ),
    );
  }
}
