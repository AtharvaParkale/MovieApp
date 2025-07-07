import 'package:flutter/material.dart';

class ImageGradientWidget extends StatelessWidget {
  const ImageGradientWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: MediaQuery.of(context).size.height * 0.1 - 50,
      left: 0,
      right: 0,
      child: Container(
        height: 60,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              Colors.black,
            ],
          ),
        ),
      ),
    );
  }
}
