import 'package:flutter/material.dart';
import 'constants.dart';

class IconContent extends StatelessWidget {

  IconContent({required this.icon, required this.lebel});

  final Icon icon;
  final String lebel;

  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        icon,
        SizedBox(
          height: 15.0,
        ),
        Text(lebel, style: kLabelTextStyle,),
      ],
    );
  }


}