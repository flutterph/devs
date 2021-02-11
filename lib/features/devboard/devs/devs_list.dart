import 'package:devs/core/constant/string.dart';
import 'package:devs/core/models/dev.dart';
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
    var itemSizeWidth = MediaQuery.of(context).size.width;
    if (devs.isEmpty) {
      return Text('No devs found');
    }

    /// Sort dev's ascending
    devs.sort((a, b) => a.name.compareTo(b.name));

    return GridView.builder(
      itemCount: devs.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: (itemSizeWidth / 470).round(),
        crossAxisSpacing: 8,
        childAspectRatio: 0.75,
      ),
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
      margin: const EdgeInsets.only(right: 32, bottom: 32),
      child: Row(
        children: [
          Container(
            height: double.infinity,
            width: 15,
            decoration: BoxDecoration(
              color: Colors.blueAccent[100],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
            ),
          ),
          // SizedBox(),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 4,
            ),
            child: Row(
              children: [
                Column(
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
                        style: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Center(
                      child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text(
                          getRoles,
                          style: Theme.of(context).textTheme.caption,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        margin: const EdgeInsets.only(
                          top: 24,
                        ),
                        child: Text(
                          dev.about,
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                      ),
                    ),
                    _socials(dev.socials)
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
