class OrderItem {
  final String title;
  final String status;
  final int items;
  final String image;

  const OrderItem({
    required this.title,
    required this.status,
    required this.items,
    required this.image,
  });

  bool get delivered => status == 'Delivered';
}

class OrderService {
  static const String month = 'October 2021';

  static const List<OrderItem> orders = [
    OrderItem(
      title: 'The Da vinci Code',
      status: 'Delivered',
      items: 1,
      image: 'assets1/cat1.png',
    ),
    OrderItem(
      title: 'Carrie Fisher',
      status: 'Delivered',
      items: 5,
      image: 'assets1/cat2.png',
    ),
    OrderItem(
      title: 'The Waiting',
      status: 'Cancelled',
      items: 2,
      image: 'assets1/cat3.png',
    ),
  ];
}
