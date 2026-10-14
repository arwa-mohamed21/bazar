import 'package:flutter/material.dart';
import '../services/product_service.dart';
import '../theme/app_color.dart';
import '../theme/app_textstyle.dart';
import '../widget/custom_button_widget.dart';
import '../widget/custom_image_widget.dart';
import '../widget/custom_secondary_button_widget.dart';

class BookDetailsView extends StatefulWidget {
  final Book book;
  const BookDetailsView({super.key, required this.book});

  @override
  State<BookDetailsView> createState() => _BookDetailsViewState();
}

class _BookDetailsViewState extends State<BookDetailsView> {
  int _qty = 1;
  bool _favorite = true;

  @override
  Widget build(BuildContext context) {
    final book = widget.book;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                padding: EdgeInsets.zero,
                icon: const Icon(Icons.arrow_back),
                onPressed: () => Navigator.pop(context),
              ),
              const SizedBox(height: 8),
              Center(
                child: CustomImageWidget(
                  path: book.image,
                  width: 200,
                  height: 280,
                  radius: 12,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      book.title,
                      style: AppTextStyle.label.copyWith(fontSize: 18),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => setState(() => _favorite = !_favorite),
                    child: Icon(
                      _favorite ? Icons.favorite : Icons.favorite_border,
                      color: AppColor.primary,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              const Align(
                alignment: Alignment.centerLeft,
                child: CustomImageWidget(
                  path: ProductService.goodayLogo,
                  height: 24,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                book.description,
                style: AppTextStyle.subtitle.copyWith(fontSize: 12),
              ),
              const SizedBox(height: 20),
              Text('Review', style: AppTextStyle.label.copyWith(fontSize: 16)),
              const SizedBox(height: 8),
              Row(
                children: [
                  ...List.generate(
                    5,
                    (i) => Icon(
                      Icons.star_rounded,
                      size: 22,
                      color: i < 4 ? Colors.amber : AppColor.inactive,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    '(4.0)',
                    style: AppTextStyle.subtitle.copyWith(fontSize: 11),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      if (_qty > 1) setState(() => _qty--);
                    },
                    icon: const Icon(Icons.remove_circle_outline),
                    color: AppColor.textGrey,
                  ),
                  Text('$_qty', style: AppTextStyle.label),
                  IconButton(
                    onPressed: () => setState(() => _qty++),
                    icon: const Icon(Icons.add_circle),
                    color: AppColor.primary,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '\$${(book.price * _qty).toStringAsFixed(2)}',
                    style: AppTextStyle.label.copyWith(color: AppColor.primary),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: CustomButtonWidget(
                      text: 'Continue shopping',
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    flex: 2,
                    child: CustomSecondaryButtonWidget(
                      text: 'View cart',
                      onPressed: () {}, // TODO: Cart screen
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
