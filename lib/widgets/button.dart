import 'package:burn_that_cv/config/config.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final BuildContext context;
  final String name;
  final void Function() onPressed;
  final bool isGradient;
  final LinearGradient gradient;

  const Button({
    Key key,
    this.context,
    this.name,
    this.onPressed,
    this.isGradient = true,
    this.gradient = const LinearGradient(colors: [kPrimaryColor, kSecColor]),
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: getHeight(context) < minHeight ? 160.0 : getWidth(context) - 200,
      height: getHeight(context) < minHeight ? 50 : getHeight(context) / 18,
      child: RaisedButton(
        elevation: 0.0,
        onPressed: onPressed,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
        padding: EdgeInsets.all(0.0),
        child: Ink(
          decoration: isGradient
              ? BoxDecoration(
                  gradient: gradient, borderRadius: BorderRadius.circular(30.0))
              : BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(30.0)),
          child: Container(
            constraints: BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
            alignment: Alignment.center,
            child: Text(
              name,
              style: kStyle.copyWith(
                color: isGradient ? Colors.white : kBlackColor,
                fontSize: 24.0,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
