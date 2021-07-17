import 'package:apps_factory/app/domain/album/album_model.dart';
import 'package:apps_factory/app/domain/artist/image_size.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlbumWidget extends StatelessWidget {
  final AlbumModel album;

  const AlbumWidget({Key? key, required this.album}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 20,
      child: Row(
        children: [
          Expanded(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    album.name,
                    style: Theme.of(context).textTheme.headline6,
                    textAlign: TextAlign.start,
                    maxLines: 2,
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(CupertinoIcons.play_circle),
                      const SizedBox(width: 6),
                      Text(album.playcount.toString()),
                    ],
                  )
                ],
              ),
            ),
          ),
          const SizedBox(width: 10),
          Container(
            width: 80,
            height: 80,
            child: CachedNetworkImage(
              imageUrl: album.images.firstWhere((e) => e.size == ImageSize.small).link,
              width: 78,
              height: 78,
              fit: BoxFit.cover,
              placeholder: (context, url) => const Center(child: Text('No image')),
            ),
          ),
        ],
      ),
    );
  }
}
