import 'package:flutter/material.dart';
import 'package:sample_application/Widgets/common_widgets.dart';

class CustomDetailButton extends StatelessWidget {
  const CustomDetailButton(
      {Key? key,
      required this.buttonName,
      required this.buttonValue,
      required this.icon})
      : super(key: key);

  final IconData icon;
  final String buttonName, buttonValue;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CustomRoundButton(icon: icon),
      Text(
        buttonName,
        style: TextStyle(
          color: Colors.grey,
          fontSize: 12,
        ),
      ),
      Text(buttonValue),
    ]);
  }
}