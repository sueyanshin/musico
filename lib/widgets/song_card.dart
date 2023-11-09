import 'package:flutter/material.dart';

class SongCard extends StatelessWidget {
  final AssetImage image;
  final String label;
  const SongCard({super.key, required this.image, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image(
            image: image,
            width: 140,
            height: 140,
          ),
        ),
        Text(
          label,
          style: Theme.of(context).textTheme.bodyMedium,
          softWrap: true,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
        )
      ]),
    );
  }
}
