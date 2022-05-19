import 'package:flutter/material.dart';

class CustomRoundButton extends StatelessWidget {
  const CustomRoundButton({
    Key? key,
    this.icon, this.child,
  }) : super(key: key);

  final IconData? icon;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      alignment: Alignment.center,
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(100),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 3),
            blurRadius: 3,
            color: Colors.grey.shade300,
          )
        ],
      ),
      child:child?? Icon(
        icon,
        color: Colors.black,
        size: 22,
      ),
    );
  }
}
