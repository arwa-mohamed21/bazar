import 'package:flutter/material.dart';
import '../theme/app_color.dart';

class CustomDotsWidget extends StatelessWidget {
  final int count;
  final int currentIndex;

  const CustomDotsWidget({
    super.key,
    this.count = 3,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(count, (i) {
        final isActive = i == currentIndex;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          margin: const EdgeInsets.symmetric(horizontal: 3),
          width: isActive ? 12 : 7,
          height: isActive ? 12 : 7,
          decoration: BoxDecoration(
            color: isActive ? AppColor.primary : AppColor.inactive,
            shape: BoxShape.circle,
          ),
        );
      }),
    );
  }
}
