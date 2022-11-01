import 'package:flutter/material.dart';

class ClickableIcon extends StatelessWidget {
  final IconData icon;
  final VoidCallback onClick;
  final double iconSize;
  final int iconColor;
  const ClickableIcon({
    super.key,
    required this.icon,
    required this.onClick,
    required this.iconSize,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: InkWell(
        onTap: onClick,
        child: Icon(
          icon,
          size: iconSize,
          color: Color(iconColor),
        ),
      ),
    );
  }
}
