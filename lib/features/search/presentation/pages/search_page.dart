import 'package:flutter/material.dart';
import 'package:movie_app/core/common/widgets/scaffold_widget.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScaffoldWidget(
      body: Text(
        'Search page',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
