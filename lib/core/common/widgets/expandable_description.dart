import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/app_dimensions.dart';
import 'package:movie_app/core/constants/app_font_weigth.dart';
import 'package:movie_app/core/theme/app_pallete.dart';
import 'package:movie_app/core/theme/app_text_theme.dart';

class ExpandableDescription extends StatefulWidget {
  final String text;

  const ExpandableDescription({super.key, required this.text});

  @override
  State<ExpandableDescription> createState() => _ExpandableDescriptionState();
}

class _ExpandableDescriptionState extends State<ExpandableDescription> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final textStyle = appTextTheme.labelSmall?.copyWith(
      fontWeight: AppFontWeight.medium,
      color: Colors.white70,
      height: 1.7,
      fontSize: AppDimensions.size14,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.text,
          style: textStyle,
          maxLines: _expanded ? null : 6,
          overflow: _expanded ? TextOverflow.visible : TextOverflow.ellipsis,
        ),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: () => setState(() => _expanded = !_expanded),
          child: Text(
            _expanded ? 'Read less' : 'Read more',
            style: const TextStyle(
              color: AppPallete.secondaryColor,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
