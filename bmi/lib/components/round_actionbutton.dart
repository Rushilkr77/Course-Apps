import 'package:flutter/material.dart';

class Roundactionbutton extends StatelessWidget {
  final IconData icon;
  final Function onpressed;
  Roundactionbutton({@required this.icon, @required this.onpressed});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onpressed,
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 50.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
