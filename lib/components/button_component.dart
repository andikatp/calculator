import 'package:calculator/utils/constants.dart';
import 'package:flutter/material.dart' hide BoxShadow, BoxDecoration;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

enum Shape {
  square,
  circle,
  stadium,
}

class ButtonComponent extends StatefulWidget {
  const ButtonComponent({
    Key? key,
    required this.text,
    this.textColor = kSecondaryColor,
    this.fontSize = 40,
    this.fontWeight = FontWeight.bold,
    this.width = 68,
    this.shape = Shape.square,
  }) : super(key: key);

  final String text;
  final Color textColor;
  final double fontSize;
  final FontWeight fontWeight;
  final double width;
  final Shape shape;

  @override
  State<ButtonComponent> createState() => _ButtonComponentState();
}

class _ButtonComponentState extends State<ButtonComponent> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    final borderRadius = widget.shape == Shape.circle
        ? null
        : BorderRadius.circular(widget.shape == Shape.square ? 20 : 36);
    final shape =
        widget.shape == Shape.circle ? BoxShape.circle : BoxShape.rectangle;
    return Listener(
      onPointerDown: (_) => setState(() {
        isPressed = true;
      }),
      onPointerUp: (_) => setState(() {
        isPressed = false;
      }),
      child: AnimatedContainer(
        duration: const Duration(
          milliseconds: 500,
        ),
        width: widget.width,
        height: 68,
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          shape: shape,
          color: kPrimaryColor,
          boxShadow: [
            BoxShadow(
              offset: const Offset(-2, -2),
              blurRadius: 5,
              color: const Color(0x80FFFFFF),
              inset: isPressed,
            ),
            BoxShadow(
              offset: const Offset(2, 2),
              blurRadius: 5,
              color: const Color(0x80838E9E),
              inset: isPressed,
            ),
            BoxShadow(
              offset: const Offset(2, 2),
              blurRadius: 5,
              color: isPressed ? Colors.transparent : const Color(0xCCFFFFFF),
              inset: true,
            ),
            BoxShadow(
              offset: const Offset(-2, -2),
              blurRadius: 5,
              color: isPressed ? Colors.transparent : const Color(0x66838E8E),
              inset: true,
            ),
          ],
        ),
        child: Center(
          child: Text(
            widget.text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: widget.fontSize,
              fontWeight: widget.fontWeight,
              color: widget.textColor,
            ),
          ),
        ),
      ),
    );
  }
}
