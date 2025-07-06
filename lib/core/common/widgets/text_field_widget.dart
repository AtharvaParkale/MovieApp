import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/app_font_weigth.dart';
import 'package:movie_app/core/theme/app_pallete.dart';
import 'package:movie_app/core/theme/app_text_theme.dart';

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget({
    super.key,
    required this.nameController,
    required this.onChange,
  });

  final TextEditingController nameController;
  final void Function(String keyword) onChange;

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.nameController,
      decoration: InputDecoration(
        hintText: 'Search movies,series, ...',
        hintStyle: appTextTheme.bodyMedium?.copyWith(
          fontWeight: AppFontWeight.medium,
          color: AppPallete.lightDescriptionColor,
          height: 1.5,
          fontSize: 12,
        ),
        prefixIcon: const Icon(
          Icons.search,
          color: AppPallete.lightDescriptionColor,
        ),
        filled: true,
        fillColor: AppPallete.titleColor,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 16,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
      cursorColor: AppPallete.secondaryColor,
      style: appTextTheme.bodyMedium?.copyWith(
        fontWeight: AppFontWeight.medium,
        color: AppPallete.lightDescriptionColor,
        height: 1.5,
        fontSize: 12,
      ),
      onChanged: (value) {
        widget.onChange(value);
      },
    );
  }
}
