import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import 'reusable_card.dart';
import 'input_page.dart';


class CalculateScreen extends StatefulWidget {

  CalculateScreen({
    required this.resultText,
    required this.interpretation,
    required this.bmiResult});

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  State<CalculateScreen> createState() => _CalculateScreenState();
}

class _CalculateScreenState extends State<CalculateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Your Result',
          style: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ReusableCard(
              color: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child: Text(
                      widget.resultText.toUpperCase(),
                      style: kLabelTextStyleGreen,
                    ),
                  ),
                  Center(
                    child: Text(
                      widget.bmiResult,
                      style: kNumberTextStyleResult,
                    ),
                  ),
                  Column(
                    children: [
                      Center(
                        child: Text(
                          'Normal BMI range: ',
                          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700, color: Color(0xff787989)),
                        ),
                      ),
                      SizedBox(height: 10.0,),
                      Center(
                        child: Text(
                          '18.5 - 25 kg/m2',
                          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0,),
                      child: Text(
                        widget.interpretation,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20.0,),
                      ),
                    ),
                  ),

                  GestureDetector(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.check_circle, size: 70.0,),
                                SizedBox(height: 20.0,),
                                Text(
                                  'Saved successfully!',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          duration: const Duration(seconds: 2),
                          // action: SnackBarAction(
                          //   label: 'UNDO',
                          //   onPressed: () {},
                          // ),
                          backgroundColor: Color(0xff1b1829),
                        ),
                      );
                    },
                    child: Center(
                      child: Container(
                        color: Color(0xff1b1829),
                        padding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 50.0,),
                        child: Text('SAVE RESULT', style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500,
                        ),),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
          BottomButton(
            onTap: () {
              Navigator.pop(context);
            },
            buttonTitle: 'RE-CALCULATE',
          ),
        ],
      ),
    );
  }
}




