import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  static const Color secondaryColor = Color.fromRGBO(251, 151, 34, 1);

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: Center(
        child: SizedBox(
          width: 32,
          height: 32,
          child: CircularProgressIndicator(
            strokeWidth: 3,
            valueColor: AlwaysStoppedAnimation<Color>(secondaryColor),
          ),
        ),
      ),
    );
  }
}
