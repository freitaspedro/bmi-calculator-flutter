import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/components/icon_content.dart';
import 'package:bmi_calculator/components/minus_plus_content.dart';
import 'package:bmi_calculator/screens/results_page.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Gender selectedGender;
  int height = 180;
  int weight = 60;
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
                      color: (selectedGender == Gender.male)
                          ? kActiveCardColor : kInactiveCardColor,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.mars,
                        label: 'MALE',
                      ),
                      onTap: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                    )
                  ),
                  Expanded(
                    child: ReusableCard(
                      color: (selectedGender == Gender.female)
                          ? kActiveCardColor : kInactiveCardColor,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.venus,
                        label: 'FEMALE',
                      ),
                      onTap: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                    )
                  ),
                ],
              )
          ),
          Expanded(
            child: ReusableCard(
              color: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kNumberTextStyle,
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        'cm',
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: kInactiveTrackColor,
                      thumbColor: kThumbColor,
                      overlayColor: kOverlayColor,
                      thumbShape:
                        RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                        RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      label: '$height',
                      onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                      },
                    ),
                  )
                ],
              ),
            )
          ),
          Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      color: kActiveCardColor,
                      cardChild: MinusPlusContent(
                        label: 'WEIGHT',
                        value: weight,
                        onMinusPressed: () {
                          setState(() {
                            weight--;
                          });
                        },
                        onPlusPressed: () {
                          setState(() {
                            weight++;
                          });
                        },
                      ),
                    ),
                  ),
                  Expanded(
                      child: ReusableCard(
                        color: kActiveCardColor,
                        cardChild: MinusPlusContent(
                          label: 'AGE',
                          value: age,
                          onMinusPressed: () {
                            setState(() {
                              age--;
                            });
                          },
                          onPlusPressed: () {
                            setState(() {
                              age++;
                            });
                          },
                        ),
                      ),
                  ),
                ],
              ),
          ),
          BottomButton(
            label: 'CALCULTE',
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ResultsPage()));
            },
          ),
        ],
      ),
    );
  }
}
