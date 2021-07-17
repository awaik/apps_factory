import 'package:apps_factory/app/domain/artist/artist_model.dart';
import 'package:apps_factory/app/domain/artist/image_size.dart';
import 'package:apps_factory/app/view/albums_screen/albums_screen.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ArtistWidget extends StatelessWidget {
  final ArtistModel artist;

  const ArtistWidget({Key? key, required this.artist}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AlbumsScreen(artist: artist)),
      ),
      child: Container(
        color: Colors.transparent, // this color make the whole area clickable
        width: MediaQuery.of(context).size.width - 20,
        child: Row(
          children: [
            Expanded(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      artist.name,
                      style: Theme.of(context).textTheme.headline6,
                      textAlign: TextAlign.start,
                      maxLines: 2,
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(CupertinoIcons.eye),
                        const SizedBox(width: 6),
                        Text(artist.listeners.toString()),
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
                imageUrl: artist.images.firstWhere((e) => e.size == ImageSize.small).link,
                width: 78,
                height: 78,
                fit: BoxFit.cover,
                placeholder: (context, url) => const Center(child: Text('No image')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
