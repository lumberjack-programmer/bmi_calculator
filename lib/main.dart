import 'package:flutter/material.dart';
import 'input_page.dart';
import 'calculate_screen.dart';



void main() => runApp(const BMICalculator());


class BMICalculator extends StatelessWidget {
  const BMICalculator({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          appBarTheme: AppBarTheme(
            color: Color(0xff0a0E21)
          ),
          scaffoldBackgroundColor: Color(0xff0a0e21),
          accentColor: Colors.purple,
      ),
      debugShowCheckedModeBanner: false,
      home: InputPage(),
    );
  }
}


