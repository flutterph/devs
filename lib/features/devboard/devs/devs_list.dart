import 'package:devs/core/constant/colors.dart';
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

    if (itemSizeWidth < 730) {
      return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 1.8,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          crossAxisCount: (itemSizeWidth / 450).round(),
        ),
        itemCount: devs.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (_, i) => _DevListCardMobile(
          dev: devs[i],
        ),
      );
    }

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        crossAxisCount: (itemSizeWidth / 450).round(),
      ),
      itemCount: devs.length,
      itemBuilder: (_, i) => _DevListCard(
        dev: devs[i],
      ),
    );
  }
}

class _DevListCard extends StatelessWidget {
  final Dev dev;
  const _DevListCard({Key key, this.dev}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDark = false;
    final bool hasSocials = dev.socials == null;
    final String roles = dev.roles.join(" • ");
    final Color iconColor = isDark ? Colors.blueAccent[100] : Colors.blueAccent;

    _launchURL(String url) async {
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        print('Could not launch $url');
      }
    }

    TextStyle renderCardTextStyle(
      double fontSize,
      FontWeight fontWeight,
      bool withOpacity,
    ) {
      Color textColor = !isDark ? Colors.black : Colors.white;
      if (withOpacity) {
        textColor = isDark
            ? Colors.white.withOpacity(.6)
            : Colors.black.withOpacity(.6);
      }

      return TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: textColor,
      );
    }

    Widget _socials(Socials socials) {
      return socials == null
          ? Container()
          : Container(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: FaIcon(
                      FontAwesomeIcons.twitter,
                      size: 20,
                    ),
                    onPressed: socials.twitter.isEmpty
                        ? null
                        : () {
                            _launchURL(socials.twitter);
                          },
                  ),
                  IconButton(
                    icon: FaIcon(
                      FontAwesomeIcons.facebook,
                      size: 20,
                    ),
                    onPressed: socials.facebook.isEmpty
                        ? null
                        : () {
                            _launchURL(socials.facebook);
                          },
                  ),
                  IconButton(
                    icon: FaIcon(
                      FontAwesomeIcons.linkedinIn,
                      size: 20,
                    ),
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

    return Container(
      height: 250,
      margin: EdgeInsets.only(
        bottom: 16,
      ),
      decoration: BoxDecoration(
        color: !isDark ? Colors.white : Color(0xff192C48),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            color: Colors.black.withOpacity(.05),
            offset: Offset(0, 5),
          )
        ],
      ),
      child: Row(
        children: [
          Container(
            height: double.infinity,
            width: 15,
            decoration: BoxDecoration(
              color:
                  iconColor, // Color can be based on the color specified by the contributor in json file (e.g. #c31432)
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
            ),
          ),
          SizedBox(
            width: 8,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 4,
              ),
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                            '${StringConstant.baseImageURL}${dev.username}'),
                        radius: 45,
                      ),
                      hasSocials
                          ? Container()
                          : Expanded(child: _socials(dev.socials)),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 16),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              dev.name,
                              maxLines: 2,
                              style: renderCardTextStyle(
                                  21, FontWeight.bold, false),
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              roles,
                              maxLines: 2,
                              style: renderCardTextStyle(
                                  14, FontWeight.w300, true),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                        Text(
                          dev.about,
                          maxLines: 2,
                          style: renderCardTextStyle(14, FontWeight.w200, true),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _DevListCardMobile extends StatelessWidget {
  final Dev dev;
  const _DevListCardMobile({Key key, this.dev}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDark = false;
    final double _iconSize = 20;
    final String roles = dev.roles.join(" • ");
    final Color iconColor = isDark ? Colors.blueAccent[100] : Colors.blueAccent;

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
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    child: FaIcon(
                      FontAwesomeIcons.twitter,
                      size: _iconSize,
                    ),
                    onTap: socials.twitter.isEmpty
                        ? null
                        : () {
                            _launchURL(socials.twitter);
                          },
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  GestureDetector(
                    child: FaIcon(
                      FontAwesomeIcons.facebook,
                      size: _iconSize,
                    ),
                    onTap: socials.facebook.isEmpty
                        ? null
                        : () {
                            _launchURL(socials.facebook);
                          },
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  GestureDetector(
                    child: FaIcon(
                      FontAwesomeIcons.linkedinIn,
                      size: _iconSize,
                    ),
                    onTap: socials.linkedin.isEmpty
                        ? null
                        : () {
                            _launchURL(socials.linkedin);
                          },
                  ),
                  SizedBox(
                    width: 16,
                  ),
                ],
              ),
            );
    }

    return Container(
      width: double.infinity,
      height: 200,
      margin: EdgeInsets.only(
        right: 16,
        bottom: 16,
      ),
      decoration: BoxDecoration(
        color: !isDark ? Colors.white : Color(0xff192C48),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            color: Colors.black.withOpacity(.05),
            offset: Offset(0, 5),
          )
        ],
      ),
      child: Row(
        children: [
          Container(
            height: double.infinity,
            width: 15,
            decoration: BoxDecoration(
              color:
                  iconColor, // Color can be based on the color specified by the contributor in json file (e.g. #c31432)
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
            ),
          ),
          SizedBox(
            width: 8,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 4,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                            '${StringConstant.baseImageURL}${dev.username}'),
                        radius: 35,
                      ),
                      Expanded(
                        child: SizedBox(),
                      ),
                      _socials(dev.socials),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    dev.name,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: isDark ? Colors.white : Colors.black,
                    ),
                  ),
                  Text(
                    roles,
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w300,
                      color: isDark
                          ? ColorsConstant().lightColor
                          : ColorsConstant().darkColor,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Expanded(
                    child: SizedBox(),
                  ),
                  Text(
                    dev.about,
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w200,
                      color: isDark
                          ? ColorsConstant().lightColor
                          : ColorsConstant().darkColor,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
