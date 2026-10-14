import 'package:flutter/material.dart';
import '../widget/custom_bottom_nav_widget.dart';
import 'home_view.dart';
import 'category_view.dart';
import '../profile/profile_view.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int _index = 0;

  final List<Widget> _pages = const [
    HomeView(),
    CategoryView(),
    _Soon('Cart'),
    ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _index, children: _pages),
      bottomNavigationBar: CustomBottomNavWidget(
        currentIndex: _index,
        onTap: (i) => setState(() => _index = i),
      ),
    );
  }
}

class _Soon extends StatelessWidget {
  final String name;
  const _Soon(this.name);

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('$name - coming soon'));
  }
}
