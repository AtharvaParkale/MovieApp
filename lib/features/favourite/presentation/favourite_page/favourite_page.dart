import 'package:flutter/material.dart';
import 'package:movie_app/core/common/widgets/scaffold_widget.dart';

class FavouritePage extends StatelessWidget {
  const FavouritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScaffoldWidget(
      body: Text(
        'Favourite Page',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
