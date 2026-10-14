import 'package:flutter/material.dart';
import '../services/product_service.dart';
import '../theme/app_color.dart';
import '../theme/app_textstyle.dart';
import 'custom_image_widget.dart';

class CustomBookListItemWidget extends StatelessWidget {
  final Book book;
  final VoidCallback? onTap;
  final Widget? trailing;

  const CustomBookListItemWidget({
    super.key,
    required this.book,
    this.onTap,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Row(
              children: [
                CustomImageWidget(
                  path: book.image,
                  width: 48,
                  height: 48,
                  radius: 8,
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        book.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyle.label,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '\$${book.price.toStringAsFixed(2)}',
                        style: AppTextStyle.subtitle.copyWith(
                          fontSize: 12,
                          color: AppColor.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                if (trailing != null) trailing!,
              ],
            ),
          ),
          const Divider(height: 1, color: AppColor.inactive),
        ],
      ),
    );
  }
}
