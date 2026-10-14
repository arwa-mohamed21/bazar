import 'package:flutter/material.dart';
import '../theme/app_color.dart';

class CustomImageWidget extends StatelessWidget {
  final String path;
  final double? width;
  final double? height;
  final double radius;
  final bool circle;
  final BoxFit fit;

  const CustomImageWidget({
    super.key,
    required this.path,
    this.width,
    this.height,
    this.radius = 8,
    this.circle = false,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    final image = Image.asset(
      path,
      width: width,
      height: height,
      fit: fit,
      errorBuilder: (_, __, ___) => Container(
        width: width,
        height: height,
        color: AppColor.inactive,
        child: const Icon(Icons.image_outlined, color: AppColor.textGrey),
      ),
    );
    return circle
        ? ClipOval(child: image)
        : ClipRRect(borderRadius: BorderRadius.circular(radius), child: image);
  }
}
