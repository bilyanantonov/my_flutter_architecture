import 'package:flutter/material.dart';

class SocialLoginButton extends StatelessWidget {
  final String butonText;
  final double fontSize;
  final Color butonColorLeft;
  final Color butonColorRight;
  final Color textColor;
  final double radius;
  final double width;
  final double height;
  final Widget butonIcon;
  final VoidCallback onPressed;

  const SocialLoginButton(
      {Key key,
      @required this.butonText,
      this.fontSize : 16,
      this.butonColorLeft :const Color(0xff94e7e1),
      this.butonColorRight :const Color(0xff3eb6e2),
      this.textColor: Colors.white,
      this.radius: 16,
      @required this.width,
      this.height: 50,
      this.butonIcon,
      @required this.onPressed})
      : assert(butonText != null, onPressed != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: RaisedButton(
        onPressed: onPressed,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50)
        ),
        textColor: Colors.white,
        padding: EdgeInsets.all(0.0),
        child: Container(
          width: width,
          alignment: Alignment.center,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
              gradient: LinearGradient(
            colors: [
              butonColorLeft,
              butonColorRight
            ],
          )),
          padding: const EdgeInsets.all(10.0),
          child: Text(
            butonText,
            style: TextStyle(fontSize: fontSize),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
