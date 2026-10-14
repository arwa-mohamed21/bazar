import 'package:flutter/material.dart';
import '../theme/app_color.dart';

class CustomSocialButtonWidget extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback? onPressed;

  const CustomSocialButtonWidget({
    super.key,
    required this.text,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: OutlinedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon, color: AppColor.textDark, size: 22),
        label: Text(
          text,
          style: const TextStyle(
            color: AppColor.textDark,
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: AppColor.inactive),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}
