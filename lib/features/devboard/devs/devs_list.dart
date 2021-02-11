import 'package:devs/core/constant/string.dart';
import 'package:devs/core/models/dev.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

enum ListType { AVATAR, CARD_FIRST, CARD_SECOND, GRID }

class DevsList extends StatelessWidget {
  final List<Dev> devs;
  final ListType listType;

  const DevsList({
    Key key,
    this.devs = const [],
    this.listType = ListType.AVATAR,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var itemSizeWidth = MediaQuery.of(context).size.width;
    if (devs.isEmpty) {
      return Text('No devs found');
    }

    /// Sort dev's ascending
    devs.sort((a, b) => a.name.compareTo(b.name));

    if (this.listType == ListType.AVATAR) {
      return Container(
        height: 200,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: devs.length,
          itemBuilder: (_, i) => _DevListItem(
            dev: devs[i],
          ),
        ),
      );
    }

    if (this.listType == ListType.CARD_FIRST) {
      return Container(
        height: 200,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: devs.length,
          itemBuilder: (_, i) => _DevListCardFirst(
            dev: devs[i],
          ),
        ),
      );
    }

    if (this.listType == ListType.AVATAR) {
      return Container(
        height: 200,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: devs.length,
          itemBuilder: (_, i) => _DevListCardSecond(
            dev: devs[i],
          ),
        ),
      );
    }

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

class _DevListCardSecond extends StatelessWidget {
  final Dev dev;

  const _DevListCardSecond({Key key, this.dev}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDark = false;

    final Color lightColor = Colors.white.withOpacity(.6);
    final Color darkColor = Colors.black.withOpacity(.6);

    final TextStyle title = TextStyle(
      fontSize: 21,
      fontWeight: FontWeight.bold,
      color: isDark ? Colors.white : Colors.black,
    );
    final TextStyle subTitle = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w300,
      color: isDark ? lightColor : darkColor,
    );
    final TextStyle content = subTitle.copyWith(
      fontWeight: FontWeight.w200,
      color: isDark ? lightColor : darkColor,
    );
    final String roles = dev.roles.join(" • ");
    final Color iconColor = isDark ? Colors.blueAccent[100] : Colors.blueAccent;

    return Container(
      width: 430,
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
          Padding(
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
                      radius: 50,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        // Make social icons
                        Icon(
                          Icons.link,
                          color: iconColor,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Icon(
                          Icons.brightness_2_outlined,
                          color: iconColor,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Icon(
                          Icons.location_on,
                          color: iconColor,
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  width: 16,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          dev.name,
                          style: title,
                        ),
                        SizedBox(
                          width: 250,
                          child: Text(
                            roles,
                            maxLines: 3,
                            style: subTitle,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 250,
                      child: Text(
                        dev.about,
                        maxLines: 3,
                        style: content,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      'Click here for more.',
                      style: content.copyWith(
                        fontWeight: FontWeight.bold,
                        color: isDark ? Colors.blue[50] : Colors.blueGrey,
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _DevListCardFirst extends StatelessWidget {
  final Dev dev;

  const _DevListCardFirst({Key key, this.dev}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDark = false;

    final Color lightColor = Colors.white.withOpacity(.6);
    final Color darkColor = Colors.black.withOpacity(.6);

    final TextStyle title = TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: isDark ? Colors.white : Colors.black,
    );
    final TextStyle subTitle = TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.w300,
      color: isDark ? lightColor : darkColor,
    );
    final TextStyle content = subTitle.copyWith(
      fontWeight: FontWeight.w200,
      color: isDark ? lightColor : darkColor,
    );
    final String roles = dev.roles.join(" • ");
    final Color iconColor = isDark ? Colors.blueAccent[100] : Colors.blueAccent;

    return Container(
      width: 340,
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
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 4,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                          '${StringConstant.baseImageURL}${dev.username}'),
                      radius: 50,
                    ),
                    SizedBox(
                      width: 100,
                    ),
                    Row(
                      // Make social icons
                      children: [
                        Icon(
                          Icons.link,
                          color: iconColor,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Icon(
                          Icons.location_on,
                          color: iconColor,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Icon(
                          Icons.brightness_2_outlined,
                          color: iconColor,
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Text(dev.name, style: title),
                SizedBox(
                  width: 250,
                  child: Text(
                    roles,
                    maxLines: 3,
                    style: subTitle,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Expanded(
                  child: SizedBox(),
                ),
                SizedBox(
                  width: 250,
                  child: Text(
                    dev.about,
                    maxLines: 3,
                    style: content,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          )
        ],
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
