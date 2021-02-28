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
            return AnimatedSwitcher(
                duration: Duration(milliseconds: 500),
                child: (data.connectionState == ConnectionState.active)
                    ? DevsList(devs: data.data)
                    : DevProgress("Loading Developers..."));
          },
        ),
      ),
    );
  }
}

// Can also be used on jobs page
class DevProgress extends StatelessWidget {
  DevProgress(this.message);

  final String message;

  @override
  Widget build(BuildContext context) {
    var itemSizeWidth = MediaQuery.of(context).size.width;
    BoxConstraints constraints = itemSizeWidth < 730
        ? BoxConstraints.expand()
        : BoxConstraints.loose(Size.fromWidth(500));

    return Center(
      child: ConstrainedBox(
        constraints: constraints,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(message, style: Theme.of(context).textTheme.headline6),
              SizedBox(height: 16),
              LinearProgressIndicator(
                value: null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
