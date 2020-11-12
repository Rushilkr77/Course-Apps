import 'package:flutter/material.dart';

class Reusablecard extends StatelessWidget {
  final Color colour;
  final Widget cardchild;
  final Function onpress;
  Reusablecard({@required this.colour, this.cardchild, this.onpress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpress,
      child: Container(
        child: cardchild,
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0),
        ),
        margin: EdgeInsets.all(15.0),
      ),
    );
  }
}
