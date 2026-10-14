import 'package:flutter/material.dart';
import '../theme/app_color.dart';
import '../theme/app_textstyle.dart';

class CustomProfileTileWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback? onTap;

  const CustomProfileTileWidget({
    super.key,
    required this.icon,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Row(
              children: [
                Icon(icon, color: AppColor.primary, size: 20),
                const SizedBox(width: 14),
                Expanded(child: Text(title, style: AppTextStyle.label)),
                const Icon(Icons.chevron_right, color: AppColor.textGrey),
              ],
            ),
          ),
          const Divider(height: 1, color: AppColor.inactive),
        ],
      ),
    );
  }
}
