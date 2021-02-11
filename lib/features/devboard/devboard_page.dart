import 'package:devs/core/models/dev.dart';
import 'package:devs/features/devboard/devboard_model.dart';
import 'package:devs/features/devboard/devs/devs_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DevboardPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DevboardPageState();
}

class _DevboardPageState extends State<DevboardPage> {
  DevBoardModel devBoard;

  @override
  void didChangeDependencies() {
    devBoard = Provider.of<DevBoardModel>(
      context,
      listen: false,
    );
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: const EdgeInsets.only(
          left: 24,
          right: 24,
          top: 24,
        ),
        child: FutureProvider<List<Dev>>(
          create: (_) => devBoard.getDevs(),
          initialData: [],
          child: Consumer<List<Dev>>(
            builder: (_, data, __) => DevsList(
              devs: data,
              listType: ListType.GRID,
            ),
          ),
        ),
      ),
    );
    // return Scaffold(
    //   backgroundColor: Colors.white,
    //   body: Container(
    //     margin: const EdgeInsets.only(
    //       top: 72,
    //     ),
    //     child: Column(
    //       children: [
    //         Container(
    //           margin: const EdgeInsets.only(
    //             left: 24,
    //             right: 24,
    //           ),
    //           child: FutureProvider<List<Dev>>(
    //             create: (_) => devBoard.getDevs(),
    //             initialData: [],
    //             child: Consumer<List<Dev>>(
    //               builder: (_, data, __) => DevsList(
    //                 devs: data,
    //                 listType: ListType.GRID,
    //               ),
    //             ),
    //           ),
    //         ),
    //         SizedBox(
    //           height: 50,
    //         ),
    //         // Container(
    //         //   height: 200,
    //         //   child: FutureProvider<List<Dev>>(
    //         //     create: (_) => devBoard.getDevs(),
    //         //     initialData: [],
    //         //     child: Consumer<List<Dev>>(
    //         //       builder: (_, data, __) => DevsList(
    //         //         devs: data,
    //         //         listType: ListType.CARD_SECOND,
    //         //       ),
    //         //     ),
    //         //   ),
    //         // ),
    //         // Container(
    //         //   height: 250,
    //         //   child: FutureProvider<List<Dev>>(
    //         //     create: (_) => devBoard.getDevs(),
    //         //     initialData: [],
    //         //     child: Consumer<List<Dev>>(
    //         //       builder: (_, data, __) => DevsList(
    //         //         devs: data,
    //         //         listType: ListType.CARD_FIRST,
    //         //       ),
    //         //     ),
    //         //   ),
    //         // ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
