import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tapinvest/widgets/loader_widget.dart';

class ImageHolder extends StatelessWidget {
  const ImageHolder({super.key, required this.imageUrl, this.height = 31});
  final String imageUrl;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        placeholder: (_, _) => LoaderWidget(),
        errorWidget: (_, _, _) => const Icon(Icons.error),
        fit: BoxFit.contain,
        height: height,
      ),
    );
  }
}
