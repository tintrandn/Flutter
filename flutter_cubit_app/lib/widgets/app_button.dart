import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cubit/misc/colors.dart';
import 'package:flutter_cubit/widgets/app_text.dart';

class AppButton extends StatelessWidget {
  final Color color;
  final Color backgroundColor;
  double size;
  final Color borderColor;
  String? text;
  IconData? icon;
  bool? isIcon;

  AppButton(
      {Key? key,
      this.isIcon = false,
      this.text="Hi",
      this.icon,
      required this.size,
      required this.color,
      required this.backgroundColor,
      required this.borderColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        border: Border.all(
          color: borderColor,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(15),
        color: backgroundColor,
      ),
      child: isIcon == false
          ? Center(
            child: AppText(
                text: text!,
                color: color,
              ),
          )
          : Icon(
              icon,
              color: color,
            ),
    );
  }
}
