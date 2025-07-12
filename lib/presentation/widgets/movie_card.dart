import 'package:flutter/material.dart';
import 'package:movieradar/data/models/media_model.dart';

class MovieCard extends StatelessWidget {
  final MediaModel movie;

  const MovieCard({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Imagen con bordes redondeados - usando Flexible para permitir redimensionamiento
          Flexible(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                movie.thumbnailSmall,
                width: 120,
                height: 180,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 8),
          // Título con control de overflow
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Text(
              movie.displayTitle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
