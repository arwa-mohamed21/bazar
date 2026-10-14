import 'package:flutter/material.dart';
import '../theme/app_color.dart';
import '../theme/app_textstyle.dart';
import 'custom_image_widget.dart';

class CustomBannerWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final String image;
  final VoidCallback? onPressed;

  const CustomBannerWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.image,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      padding: const EdgeInsets.only(left: 16),
      decoration: BoxDecoration(
        color: AppColor.secondaryButton,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTextStyle.label.copyWith(fontSize: 16)),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: AppTextStyle.subtitle.copyWith(fontSize: 12),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 30,
                  child: ElevatedButton(
                    onPressed: onPressed,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.primary,
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: const Text(
                      'Order Now',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ),
              ],
            ),
          ),
          CustomImageWidget(path: image, width: 80, height: 120, radius: 12),
        ],
      ),
    );
  }
}
