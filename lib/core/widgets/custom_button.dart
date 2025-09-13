import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text, required this.onPressed, required this.backgroundColor, required this.textColor,  this.borderRadius,  this.fontSize});
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final BorderRadius? borderRadius;
  final double? fontSize ;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius?? BorderRadius.circular(16),
          ),
        ),
        onPressed: () {},
        child: Text(
          text,
          style: Styles.textStyle18.copyWith(
            color: textColor,
            fontWeight: FontWeight.w900,
            fontFamily: 'Bookly',
            fontSize: fontSize?? 18,
          ),
        ),
      ),
    );
  }
}
