import 'package:flutter/material.dart';
import '../services/product_service.dart';
import '../theme/app_color.dart';
import '../theme/app_textstyle.dart';
import 'custom_image_widget.dart';

class CustomBookCardWidget extends StatelessWidget {
  final Book book;
  final VoidCallback? onTap;

  const CustomBookCardWidget({super.key, required this.book, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 110,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomImageWidget(path: book.image, width: 110, height: 150),
            const SizedBox(height: 8),
            Text(
              book.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyle.label.copyWith(fontSize: 12),
            ),
            const SizedBox(height: 2),
            Text(
              '\$${book.price.toStringAsFixed(2)}',
              style: AppTextStyle.subtitle.copyWith(
                fontSize: 11,
                color: AppColor.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
