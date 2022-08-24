import 'dart:async';
import 'package:bmi_calculator/calculate_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'icon_content.dart';
import 'constants.dart';
import 'calculator_brain.dart';


enum Gender {male, female}


class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);


  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  late Timer timer;
  var selectedGender;
  int height = 180;
  int weight = 74;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    color: selectedGender == Gender.male ? kActiveCardColor : kInactiveCardColor,
                    function: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    cardChild: IconContent(
                    icon: const Icon(
                      FontAwesomeIcons.mars,
                      size: kIconSize,
                    ),
                    lebel: 'MALE',
                  ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    function: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    color: selectedGender == Gender.female ? kActiveCardColor : kInactiveCardColor,
                    cardChild: IconContent(
                      icon: const Icon(
                        FontAwesomeIcons.venus,
                        size: kIconSize,
                      ),
                      lebel: 'FEMALE',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              color: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('HEIGHT', style: kLabelTextStyle,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(height.toString(), style: kNumberTextStyle,),
                      Text('cm', style: kLabelTextStyle,),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0xff8d8e98),
                      thumbColor: Color(0xffeb1555),
                      overlayColor: Color(0x29eb1555),
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 245.0,
                      onChanged: (value) {
                        setState(() {
                          height = value.toInt();
                        });
                      },),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('WEIGHT', style: kLabelTextStyle,),
                        Text(weight.toString(), style: kNumberTextStyle,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                              GestureDetector(
                                onLongPress: () {
                                  Future.delayed(Duration(seconds: 0), () {
                                    timer = Timer.periodic(
                                      //milliseconds: 500 = increase speed
                                        Duration(milliseconds: 40), (Timer t) => setState(() {
                                      if (weight > 40) {
                                        weight--;
                                      }
                                    }));
                                  });

                                },
                                onLongPressUp: () {
                                  timer.cancel();
                                },
                                child: RoundIconButton(
                                  icon: Icons.remove,
                                  onPressed: () {
                                    setState(() {
                                      if (weight > 40) {
                                        weight--;
                                      }
                                    });
                                  },
                                ),
                              ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            GestureDetector(
                              onLongPress: () {
                                Future.delayed(Duration(seconds: 0), () {
                                  timer = Timer.periodic(
                                    //milliseconds: 500 = increase speed
                                      Duration(milliseconds: 40), (Timer t) => setState(() {
                                    if (weight < 200) {
                                      weight++;
                                    }
                                  }));
                                });

                              },
                              onLongPressUp: () {
                                timer.cancel();
                              },
                              child: RoundIconButton(
                                icon: Icons.add,
                                onPressed: () {
                                  setState(() {
                                    if (weight < 200) {
                                      weight++;
                                    }
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                      color: kActiveCardColor,
                  ),
                ),
                // Expanded(
                //   child: ReusableCard(color: kActiveCardColor),
                // ),
                Expanded(
                  child: ReusableCard(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('AGE', style: kLabelTextStyle,),
                        Text(age.toString(), style: kNumberTextStyle,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onLongPress: () {
                                Future.delayed(Duration(seconds: 0), () {
                                  timer = Timer.periodic(
                                    //milliseconds: 500 = increase speed
                                      Duration(milliseconds: 40), (Timer t) => setState(() {
                                    if (age > 10) {
                                      age--;
                                    }
                                  }));
                                });
                              },
                              onLongPressUp: () {
                                timer.cancel();
                              },
                              child: RoundIconButton(
                                icon: Icons.remove,
                                onPressed: () {
                                  setState(() {
                                    if (age > 10) {
                                      age--;
                                    }
                                  });
                                },
                              ),
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            GestureDetector(
                              onLongPress: () {
                                Future.delayed(Duration(seconds: 0), () {
                                  timer = Timer.periodic(
                                    //milliseconds: 500 = increase speed
                                      Duration(milliseconds: 40), (Timer t) => setState(() {
                                    if (age < 80) {
                                      age++;
                                    }
                                  }));
                                });
                              },
                              onLongPressUp: () {
                                timer.cancel();
                              },
                              child: RoundIconButton(
                                icon: Icons.add,
                                onPressed: () {
                                  setState(() {
                                    if (age < 80) {
                                      age++;
                                    }
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    color: kActiveCardColor,
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            onTap: () {
              CalculatorBrain calculator = CalculatorBrain(height, weight);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CalculateScreen(
                    bmiResult: calculator.calculateBMI(),
                    resultText: calculator.getResults(),
                    interpretation: calculator.getInterpretation(),
                  ),
                ),
              );

              // Navigator.pushNamed(context, '/calculate',
              //     arguments: CalculateScreen(
              //         resultText: calculator.getResults(),
              //         interpretation: calculator.getInterpretation(),
              //     ),
              // );
            },
            buttonTitle: 'CALCULATE',
          ),
        ],
      ),
    );
  }
}

class BottomButton extends StatelessWidget {
  const BottomButton({required this.onTap, required this.buttonTitle});

  final VoidCallback onTap;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: kButtonContainerColor,
        height: kButtonContainerHeight,
        padding: EdgeInsets.only(bottom: 15.0),
        margin: const EdgeInsets.only(top: 10.0),
        width: double.infinity,
        child: Center(
          child: Text(buttonTitle, style: TextStyle(
            fontSize: 23.0,
            fontWeight: FontWeight.bold,
          ),),
        ),
      ),
    );
  }
}


class RoundIconButton extends StatelessWidget {
  const RoundIconButton({Key? key, required this.onPressed, this.icon}) : super(key: key);

  final VoidCallback onPressed;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 6.0,
      shape: const CircleBorder(),
      onPressed: onPressed,
      fillColor: const Color(0xff4c4f5e),
      constraints: const BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      child: Icon(icon),
    );
  }
}
