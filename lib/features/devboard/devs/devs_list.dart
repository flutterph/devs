import 'package:devs/core/constant/string.dart';
import 'package:devs/core/models/dev.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

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

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('Could not launch $url');
    }
  }

  Widget _socials(Socials socials) {
    return socials == null
        ? Container()
        : Container(
            margin: EdgeInsets.only(top: 10),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: FaIcon(FontAwesomeIcons.twitter),
                  onPressed: socials.twitter.isEmpty
                      ? null
                      : () {
                          _launchURL(socials.twitter);
                        },
                ),
                IconButton(
                  icon: FaIcon(FontAwesomeIcons.facebook),
                  onPressed: socials.facebook.isEmpty
                      ? null
                      : () {
                          _launchURL(socials.facebook);
                        },
                ),
                IconButton(
                  icon: FaIcon(FontAwesomeIcons.linkedinIn),
                  onPressed: socials.linkedin.isEmpty
                      ? null
                      : () {
                          _launchURL(socials.linkedin);
                        },
                ),
              ],
            ),
          );
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
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: NetworkImage(
                      "${StringConstant.baseImageURL}${dev.username}"),
                  fit: BoxFit.fill),
            ),
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
            textAlign: TextAlign.center,
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
          _socials(dev.socials)
        ],
      ),
    );
  }
}
