const String _lorem =
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Viverra '
    'dignissim ac ac ac. Nibh et sed ac, eget malesuada.';

class Book {
  final String title;
  final String author;
  final double price;
  final String image;
  final String description;
  final String category;

  const Book({
    required this.title,
    required this.author,
    required this.price,
    required this.image,
    this.description = _lorem,
    this.category = 'Novels',
  });
}

class Author {
  final String name;
  final String job;
  final String image;

  const Author({required this.name, required this.job, required this.image});
}

class ProductService {
  static const List<Book> topOfWeek = [
    Book(
      title: 'The Kite Runner',
      author: 'Khaled Hosseini',
      price: 14.99,
      image: 'assets1/kite_runner.png',
    ),
    Book(
      title: 'The Subtle Art',
      author: 'Mark Manson',
      price: 20.99,
      image: 'assets1/subtle_art.png',
      category: 'Self Love',
    ),
    Book(
      title: 'The Art of War',
      author: 'Sun Tzu',
      price: 14.99,
      image: 'assets1/art_of_war.png',
    ),
  ];

  static const List<String> categories = [
    'All',
    'Novels',
    'Self Love',
    'Science',
    'Romantic',
  ];

  static const List<Book> categoryBooks = [
    Book(
      title: 'In in amet ultrices sit.',
      author: 'Author One',
      price: 19.99,
      image: 'assets1/cat1.png',
      category: 'Novels',
    ),
    Book(
      title: 'Bibendum facilisis.',
      author: 'Author Two',
      price: 27.12,
      image: 'assets1/cat2.png',
      category: 'Self Love',
    ),
    Book(
      title: 'Nulla et diam cras.',
      author: 'Author Three',
      price: 13.52,
      image: 'assets1/cat3.png',
      category: 'Science',
    ),
    Book(
      title: 'Risus malesuada in.',
      author: 'Author Four',
      price: 31.00,
      image: 'assets1/cat4.png',
      category: 'Romantic',
    ),
  ];

  static const List<Book> allBooks = [...topOfWeek, ...categoryBooks];

  static const List<Author> authors = [
    Author(name: 'John Freeman', job: 'Writer', image: 'assets1/author1.png'),
    Author(name: 'Tess Gunty', job: 'Novelist', image: 'assets1/author2.png'),
    Author(name: 'Richard Perry', job: 'Writer', image: 'assets1/author3.png'),
  ];

  static const List<String> vendors = [
    'assets1/vendor1.png',
    'assets1/vendor2.png',
    'assets1/vendor3.png',
    'assets1/vendor4.png',
  ];

  static const String bannerImage = 'assets1/apollo.png';
  static const String goodayLogo = 'assets1/gooday.png';
}
