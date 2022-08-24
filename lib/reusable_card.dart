import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {

  ReusableCard({required this.color, this.cardChild, this.function});

  final Color color;
  final Widget? cardChild;
  final VoidCallback? function;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10.0),
        ),
        height: 200.0,
        child: cardChild,
      ),
    );
  }
}







