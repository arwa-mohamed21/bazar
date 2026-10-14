import 'package:flutter/material.dart';
import '../services/product_service.dart';
import '../theme/app_color.dart';
import '../theme/app_textstyle.dart';
import '../widget/custom_book_list_item_widget.dart';
import 'book_details_view.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final _controller = TextEditingController();
  String _query = '';

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List<Book> get _results {
    final q = _query.trim().toLowerCase();
    if (q.isEmpty) return ProductService.categoryBooks;
    return ProductService.allBooks
        .where((b) => b.title.toLowerCase().contains(q))
        .toList();
  }

  OutlineInputBorder _border(Color color) => OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: BorderSide(color: color),
  );

  @override
  Widget build(BuildContext context) {
    final results = _results;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Column(
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
                        'Search',
                        style: AppTextStyle.label.copyWith(fontSize: 18),
                      ),
                    ),
                  ),
                  const SizedBox(width: 24),
                ],
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _controller,
                onChanged: (v) => setState(() => _query = v),
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: AppTextStyle.subtitle,
                  prefixIcon: const Icon(
                    Icons.search,
                    color: AppColor.textGrey,
                  ),
                  filled: true,
                  fillColor: AppColor.secondaryButton,
                  contentPadding: const EdgeInsets.symmetric(vertical: 14),
                  border: _border(AppColor.inactive),
                  enabledBorder: _border(AppColor.inactive),
                  focusedBorder: _border(AppColor.primary),
                ),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: results.isEmpty
                    ? const Center(
                        child: Text(
                          'No results found',
                          style: AppTextStyle.subtitle,
                        ),
                      )
                    : ListView.builder(
                        itemCount: results.length,
                        itemBuilder: (context, i) {
                          final book = results[i];
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
