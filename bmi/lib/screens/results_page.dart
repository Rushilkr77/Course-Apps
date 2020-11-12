import 'package:bmi/components/bottom_button.dart';
import 'package:bmi/components/reusable_card.dart';
import 'package:flutter/material.dart';
import '../constants.dart';

class Resultspage extends StatelessWidget {
  final String bmiresult;
  final String resulttext;
  final String interpretation;
  Resultspage(
      {@required this.bmiresult,
      @required this.resulttext,
      @required this.interpretation});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                'YOUR RESULT',
                style: kTitletextstyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Reusablecard(
              colour: kActivecardcolour,
              cardchild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    resulttext.toUpperCase(),
                    style: kResulttextstyle,
                  ),
                  Text(
                    bmiresult,
                    style: kBmitextstyle,
                  ),
                  Text(
                    interpretation,
                    textAlign: TextAlign.center,
                    style: kCommenttextstyle,
                  ),
                ],
              ),
            ),
          ),
          Bottombutton(
            bottomtext: 'RE-CALCULATE',
            ontap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
