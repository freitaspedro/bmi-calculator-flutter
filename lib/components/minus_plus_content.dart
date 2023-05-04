import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/components/round_icon_button.dart';
import 'package:bmi_calculator/constants.dart';

class MinusPlusContent extends StatelessWidget {

  final String label;
  final int value;
  final Function onMinusPressed;
  final Function onPlusPressed;
  MinusPlusContent({@required this.label, this.value, this.onMinusPressed, this.onPlusPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          label,
          style: kLabelTextStyle,
        ),
        Text(
          value.toString(),
          style: kNumberTextStyle,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RoundIconButton(
                icon: FontAwesomeIcons.minus,
                onPressed: onMinusPressed,
            ),
            SizedBox(
              width: 10.0,
            ),
            RoundIconButton(
                icon: FontAwesomeIcons.plus,
                onPressed: onPlusPressed,
            ),
          ],
        ),
      ],
    );
  }
}
