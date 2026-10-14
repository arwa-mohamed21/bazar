import 'package:flutter/material.dart';
import '../theme/app_color.dart';
import '../theme/app_textstyle.dart';

class CustomCategoryTabsWidget extends StatelessWidget {
  final List<String> tabs;
  final String selected;
  final ValueChanged<String> onSelected;

  const CustomCategoryTabsWidget({
    super.key,
    required this.tabs,
    required this.selected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: tabs.length,
        separatorBuilder: (_, __) => const SizedBox(width: 24),
        itemBuilder: (context, i) {
          final tab = tabs[i];
          final isSelected = tab == selected;
          return GestureDetector(
            onTap: () => onSelected(tab),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  tab,
                  style: AppTextStyle.label.copyWith(
                    color: isSelected ? AppColor.textDark : AppColor.textGrey,
                    fontWeight: isSelected
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                ),
                const SizedBox(height: 4),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  height: 2,
                  width: 20,
                  color: isSelected ? AppColor.primary : Colors.transparent,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
