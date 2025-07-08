import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatefulWidget {
  const ShimmerWidget({
    super.key,
    required this.child,
    required this.isLoading,
  });

  final Widget child;
  final bool isLoading;

  @override
  State<ShimmerWidget> createState() => _ShimmerWidgetState();
}

class _ShimmerWidgetState extends State<ShimmerWidget> {
  @override
  Widget build(BuildContext context) {
    return widget.isLoading
        ? Shimmer.fromColors(
            baseColor: const Color.fromRGBO(80, 80, 80, 1),
            highlightColor: const Color.fromRGBO(130, 130, 130, 1),
            child: widget.child,
          )
        : widget.child;
  }
}
