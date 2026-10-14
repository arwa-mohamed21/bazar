import 'package:flutter/material.dart';
import '../services/product_service.dart';
import '../theme/app_color.dart';
import '../theme/app_textstyle.dart';
import '../widget/custom_banner_widget.dart';
import '../widget/custom_book_card_widget.dart';
import '../widget/custom_image_widget.dart';
import '../widget/custom_section_header_widget.dart';
import 'book_details_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.search),
                  Text(
                    'Home',
                    style: AppTextStyle.label.copyWith(fontSize: 18),
                  ),
                  const Icon(Icons.notifications_none),
                ],
              ),
              const SizedBox(height: 20),
              CustomBannerWidget(
                title: 'Special Offer',
                subtitle: 'Discount 25%',
                image: ProductService.bannerImage,
                onPressed: () {}, // TODO: open the offer
              ),
              const SizedBox(height: 24),
              const CustomSectionHeaderWidget(title: 'Top of Week'),
              const SizedBox(height: 12),
              SizedBox(
                height: 220,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: ProductService.topOfWeek.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 12),
                  itemBuilder: (context, i) {
                    final book = ProductService.topOfWeek[i];
                    return CustomBookCardWidget(
                      book: book,
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => BookDetailsView(book: book),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 24),
              const CustomSectionHeaderWidget(title: 'Best Vendors'),
              const SizedBox(height: 12),
              Row(
                children: List.generate(
                  ProductService.vendors.length,
                  (i) => Expanded(
                    child: Container(
                      height: 60,
                      margin: EdgeInsets.only(
                        right: i == ProductService.vendors.length - 1 ? 0 : 8,
                      ),
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: AppColor.secondaryButton,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: CustomImageWidget(
                        path: ProductService.vendors[i],
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              const CustomSectionHeaderWidget(title: 'Authors'),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: ProductService.authors
                    .map(
                      (a) => Column(
                        children: [
                          CustomImageWidget(
                            path: a.image,
                            width: 80,
                            height: 80,
                            circle: true,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            a.name,
                            style: AppTextStyle.label.copyWith(fontSize: 12),
                          ),
                          Text(
                            a.job,
                            style: AppTextStyle.subtitle.copyWith(fontSize: 11),
                          ),
                        ],
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
