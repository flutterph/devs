import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class EmptyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Spacer(),
          SvgPicture.asset(
            'images/undraw_no_data.svg',
            height: 200,
            width: 200,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "No Data Found",
            style: TextStyle(
              color: Colors.blue,
              fontSize: 25
            ),
          ),
          Spacer()
        ],
      ),
    );
  }
}
