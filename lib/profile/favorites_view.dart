import 'package:flutter/material.dart';
import '../home/book_details_view.dart';
import '../services/product_service.dart';
import '../theme/app_color.dart';
import '../theme/app_textstyle.dart';
import '../widget/custom_book_list_item_widget.dart';

class FavoritesView extends StatefulWidget {
  const FavoritesView({super.key});

  @override
  State<FavoritesView> createState() => _FavoritesViewState();
}

class _FavoritesViewState extends State<FavoritesView> {
  late final List<Book> _favorites = [...ProductService.categoryBooks];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
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
                        'Your Favorites',
                        style: AppTextStyle.label.copyWith(fontSize: 18),
                      ),
                    ),
                  ),
                  const SizedBox(width: 24),
                ],
              ),
              const SizedBox(height: 12),
              Expanded(
                child: _favorites.isEmpty
                    ? const Center(
                        child: Text(
                          'No favorites yet',
                          style: AppTextStyle.subtitle,
                        ),
                      )
                    : ListView.builder(
                        itemCount: _favorites.length,
                        itemBuilder: (context, i) {
                          final book = _favorites[i];
                          return CustomBookListItemWidget(
                            book: book,
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => BookDetailsView(book: book),
                              ),
                            ),
                            trailing: GestureDetector(
                              onTap: () =>
                                  setState(() => _favorites.remove(book)),
                              child: const Icon(
                                Icons.favorite,
                                color: AppColor.primary,
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
