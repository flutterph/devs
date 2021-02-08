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

    /// Sort dev's ascending
    devs.sort((a, b) => a.name.compareTo(b.name));

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

  String get getRoles {
    var buffer = StringBuffer();
    String separator = "";
    for (var role in dev.roles) {
      buffer..write(separator)..write(role);
      separator = " • ";
    }
    return buffer.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240,
      margin: const EdgeInsets.only(right: 32),
      child: Column(
        children: [
          Container(
            height: 220,
            width: 220,
            color: Colors.black,
          ),
          Container(
            margin: const EdgeInsets.only(
              top: 12,
            ),
            child: Text(
              dev.name,
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Text(
            getRoles,
            style: Theme.of(context).textTheme.caption,
          ),
          Container(
            margin: const EdgeInsets.only(
              top: 24,
            ),
            child: Text(
              dev.about,
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ),
        ],
      ),
    );
  }
}
