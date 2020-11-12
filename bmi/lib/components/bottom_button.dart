import 'package:flutter/material.dart';
import '../constants.dart';

class Bottombutton extends StatelessWidget {
  final Function ontap;
  final String bottomtext;
  Bottombutton({@required this.ontap, @required this.bottomtext});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        child: Center(
          child: Text(
            bottomtext,
            style: kLargebuttontextstyle,
          ),
        ),
        color: kBottomcontainercolour,
        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.only(bottom: 20.0),
        width: double.infinity,
        height: kBottomcontainerheight,
      ),
    );
  }
}
