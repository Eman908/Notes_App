import 'package:flutter/material.dart';

class CustomeIcon extends StatelessWidget {
  const CustomeIcon({super.key, this.icon, this.onPressed, this.color});
  final IconData? icon;
  final Color? color;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 45,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
        child: IconButton(icon: Icon(icon, size: 28), onPressed: onPressed),
      ),
    );
  }
}
