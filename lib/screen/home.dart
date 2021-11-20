import 'package:bmi_app/constants/app_const.dart';
import 'package:bmi_app/widgets/right_bar.dart';
import 'package:bmi_app/widgets/left_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _height = TextEditingController();
  TextEditingController _weight = TextEditingController();
  double _bmiResult = 0;
  String _textResult = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI Calculator',
          style: TextStyle(
            color: accentColor,
            fontWeight: FontWeight.w300
          )
        ),
        backgroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: mainColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 130,
                  child: TextField(
                    controller: _height,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.w300,
                      color: accentColor
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Height",
                      hintStyle: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w300,
                        color: Colors.white.withOpacity(.8)
                      )
                    ),
                  ),
                ), //height
                Container(
                  width: 130,
                  child: TextField(
                    controller: _weight,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w300,
                        color: accentColor
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Weight",
                        hintStyle: TextStyle(
                            fontSize: 42,
                            fontWeight: FontWeight.w300,
                            color: Colors.white.withOpacity(.8)
                        )
                    ),
                  ),
                ), //weight
              ],
            ), //inputs
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    double _h = double.parse(_height.text);
                    double _w = double.parse(_weight.text);
                    setState(() {
                      _bmiResult = _w / (_h * _h);
                      if(_bmiResult > 25) {
                        _textResult = 'You\'re over weight';
                      }
                      else if(_bmiResult >= 18.5 && _bmiResult <=25) {
                        _textResult = 'You have normal weight';
                      }
                      else {
                        _textResult = 'You are under weight';
                      }
                    });
                  },
                  child: Container(
                    child: Text(
                      'Calculate',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: accentColor
                      ),
                    ),
                  ),
                ), //Calculate Button
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _bmiResult = 0;
                      _textResult = '';
                      _weight.clear();
                      _height.clear();
                    });
                  },
                  child: Container(
                    child: Text(
                      'Reset',
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: accentColor
                      ),
                    ),
                  ),
                ), //Reset Button
              ],
            ), //buttons
            const SizedBox(height: 25),
            Container(
              child: Text(
                _bmiResult.toStringAsFixed(2),
                style: TextStyle(
                  fontSize: 90,
                  color: accentColor
                ),
              ),
            ), //bmi number result
            const SizedBox(height: 30),
            Visibility(
              visible: _textResult.isNotEmpty,
              child: Container(
                child: Text(
                  _textResult,
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w400,
                    color: accentColor
                  ),
                ),
              ),
            ), //bmi text result

            //Left Bars
            const SizedBox(height: 10),
            const LeftBar(barWidth: 40),
            const SizedBox(height: 15),
            const LeftBar(barWidth: 70),
            const SizedBox(height: 15),
            const LeftBar(barWidth: 40),

            //Right Bars
            const SizedBox(height: 20),
            const RightBar(barWidth: 70),
            const SizedBox(height: 25),
            const RightBar(barWidth: 50),

          ],
        ),
      ),
    );
  }
}
