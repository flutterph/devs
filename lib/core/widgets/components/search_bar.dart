import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  final Function(String search) onChanged;

  const SearchBar({
    Key key,
    this.onChanged,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SearchBarState();
  }
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      width: MediaQuery.of(context).size.width * 0.35,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 30,
            spreadRadius: 10,
            color: Colors.grey.shade100,
          ),
        ],
      ),
      child: Container(
        margin: const EdgeInsets.only(
          left: 10,
          top: 3,
        ),
        child: TextField(
          onChanged: (String value) {
            widget.onChanged(value);
          },
          style: TextStyle(
            fontSize: 25,
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Search name, Github usernames...',
            hintStyle: TextStyle(
              fontSize: 25,
            ),
            prefixIcon: Icon(
              Icons.search,
              size: 32.0,
            ),
          ),
        ),
      ),
    );
  }
}
