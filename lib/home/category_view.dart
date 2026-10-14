import 'package:flutter/material.dart';
import '../services/product_service.dart';
import '../theme/app_textstyle.dart';
import '../widget/custom_book_list_item_widget.dart';
import '../widget/custom_category_tabs_widget.dart';
import 'book_details_view.dart';
import 'search_view.dart';

class CategoryView extends StatefulWidget {
  const CategoryView({super.key});

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  String _selected = 'All';

  List<Book> get _books => _selected == 'All'
      ? ProductService.categoryBooks
      : ProductService.categoryBooks
            .where((b) => b.category == _selected)
            .toList();

  @override
  Widget build(BuildContext context) {
    final books = _books;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const SearchView()),
                    ),
                    child: const Icon(Icons.search),
                  ),
                  Text(
                    'Category',
                    style: AppTextStyle.label.copyWith(fontSize: 18),
                  ),
                  const Icon(Icons.notifications_none),
                ],
              ),
              const SizedBox(height: 20),
              CustomCategoryTabsWidget(
                tabs: ProductService.categories,
                selected: _selected,
                onSelected: (tab) => setState(() => _selected = tab),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: books.isEmpty
                    ? const Center(
                        child: Text(
                          'No books here yet',
                          style: AppTextStyle.subtitle,
                        ),
                      )
                    : ListView.builder(
                        itemCount: books.length,
                        itemBuilder: (context, i) {
                          final book = books[i];
                          return CustomBookListItemWidget(
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
            ],
          ),
        ),
      ),
    );
  }
}
