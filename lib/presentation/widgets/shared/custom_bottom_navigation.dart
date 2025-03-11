import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBottomNavigation extends StatelessWidget {
  const CustomBottomNavigation({super.key});

  void onItemTapped(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.go('/');
        break;
      case 1:
        context.go('/');
        break;
      case 2:
        context.go('/favorites');
        break;
    }
  }

  int getCurrentIndex(BuildContext context) {
    //final String location = GoRouterState.of(context).location // validate .location
    final String location = GoRouterState.of(context).matchedLocation;

    switch (location) {
      case '/':
        return 0;
      case '/categories':
        return 1;
      case 'favorites':
        return 2;
      default:
        return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 0,
      onTap: (index) {
        onItemTapped(context, index);
      },
      currentIndex: getCurrentIndex(context),
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_max),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.category_outlined),
          label: 'Categories',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_outline),
          label: 'Favorites',
        ),
      ],
    );
  }
}
