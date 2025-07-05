import 'package:flutter/material.dart';
import 'package:movie_app/core/common/widgets/title_chip_widget.dart';

class TrendingNowWidget extends StatelessWidget {
  const TrendingNowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleChipWidget(),
        ],
      ),
    );
  }
}
