import 'package:flutter/material.dart';
import '../services/order_service.dart';
import '../theme/app_color.dart';
import '../theme/app_textstyle.dart';
import '../widget/custom_image_widget.dart';

class OrderHistoryView extends StatelessWidget {
  const OrderHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    const orders = OrderService.orders;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.arrow_back),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        'Order History',
                        style: AppTextStyle.label.copyWith(fontSize: 18),
                      ),
                    ),
                  ),
                  const SizedBox(width: 24),
                ],
              ),
              const SizedBox(height: 24),
              Text(
                OrderService.month,
                style: AppTextStyle.label.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: AppColor.inactive),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: List.generate(orders.length, (i) {
                    final order = orders[i];
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: Row(
                            children: [
                              CustomImageWidget(
                                path: order.image,
                                width: 44,
                                height: 44,
                                radius: 8,
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      order.title,
                                      style: AppTextStyle.label,
                                    ),
                                    const SizedBox(height: 4),
                                    Row(
                                      children: [
                                        Text(
                                          order.status,
                                          style: AppTextStyle.subtitle.copyWith(
                                            fontSize: 11,
                                            color: order.delivered
                                                ? AppColor.success
                                                : AppColor.error,
                                          ),
                                        ),
                                        Text(
                                          '  •  ${order.items} '
                                          '${order.items == 1 ? 'item' : 'items'}',
                                          style: AppTextStyle.subtitle.copyWith(
                                            fontSize: 11,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (i != orders.length - 1)
                          const Divider(height: 1, color: AppColor.inactive),
                      ],
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
