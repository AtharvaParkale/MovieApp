import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/app_font_weigth.dart';
import 'package:movie_app/core/theme/app_pallete.dart';
import 'package:movie_app/core/theme/app_text_theme.dart';
import 'package:movie_app/core/utils/custom_page_router.dart';
import 'package:movie_app/features/favourite/presentation/favourite_page/favourite_page.dart';
import 'package:movie_app/features/home/presentation/pages/home_page.dart';
import 'package:movie_app/features/search/presentation/pages/search_page.dart';

class StackHome extends StatefulWidget {
  static route() => CustomPageRoute.route(
        const StackHome(),
        PageRouteDirection.LEFT,
      );

  const StackHome({super.key});

  @override
  State<StackHome> createState() => _StackHomeState();
}

class _StackHomeState extends State<StackHome> {
  int _selectedIndex = 0;

  final List<Widget> widgetOptions = const [
    HomePage(),
    SearchPage(),
    FavouritePage(),
    FavouritePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomAppBar(
        color: Color.fromRGBO(55, 55, 55, 1),
        shape: const CircularNotchedRectangle(),
        notchMargin: 2,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _buildBottomNavItem('Home', Icons.home, 0),
              _buildBottomNavItem('Search', Icons.search, 1),
              _buildBottomNavItem(
                  'Favourite', Icons.favorite_outline_rounded, 2),
              _buildBottomNavItem('About', Icons.desktop_mac_outlined, 3),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomNavItem(String label, IconData icon, int index) {
    return MaterialButton(
      minWidth: 40,
      onPressed: () => _onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            icon,
            color: _selectedIndex == index
                ? AppPallete.secondaryColor
                : AppPallete.descriptionColor,
          ),
          Text(
            label,
            style: appTextTheme.bodySmall?.copyWith(
              fontWeight: AppFontWeight.semiBold,
              color: _selectedIndex == index
                  ? AppPallete.secondaryColor
                  : AppPallete.descriptionColor,
            ),
          ),
        ],
      ),
    );
  }
}
