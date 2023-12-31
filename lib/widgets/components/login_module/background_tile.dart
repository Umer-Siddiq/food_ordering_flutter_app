import 'package:flutter/material.dart';

class BackgroundTile extends StatelessWidget {
  final ImageProvider<Object>? bgImage;
  final Widget? frontContent;
  final EdgeInsetsGeometry? padding;
  final double? opacity;
  const BackgroundTile({
    super.key,
    required this.bgImage,
    required this.frontContent,
    this.padding,
    this.opacity,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        padding: padding,
        decoration: BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
              fit: BoxFit.cover, opacity: opacity ?? 95, image: bgImage!),
        ),
        child: frontContent);
  }
}
