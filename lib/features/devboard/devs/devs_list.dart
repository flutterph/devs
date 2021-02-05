import 'package:devs/core/models/dev.dart';
import 'package:flutter/material.dart';

class DevsList extends StatelessWidget {
  final List<Dev> devs;

  const DevsList({
    Key key,
    this.devs = const [],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (devs.isEmpty) {
      return Text('No devs found');
    }

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: devs.length,
      itemBuilder: (_, i) => _DevListItem(
        dev: devs[i],
      ),
    );
  }
}

class _DevListItem extends StatelessWidget {
  final Dev dev;

  const _DevListItem({
    Key key,
    this.dev,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(dev.name),
          Text(dev.about),
        ],
      ),
    );
  }
}
