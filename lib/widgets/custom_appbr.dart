import 'package:flutter/material.dart';
import 'package:todo/widgets/custome_icon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.icon,
    this.onPressed,
    this.color,
  });
  final String title;
  final IconData? icon;
  final void Function()? onPressed;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: const TextStyle(fontSize: 28)),
        CustomeIcon(icon: icon, onPressed: onPressed, color: color),
      ],
    );
  }
}
