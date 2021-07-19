// import 'package:apps_factory/app/data/albums/cache/hive_album_model.dart';
import 'package:apps_factory/app/domain/album/album_model.dart';
import 'package:apps_factory/app/domain/artist/image_size.dart';
import 'package:apps_factory/app/view/album_screen/album_screen.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// import 'package:flutter_swipe_action_cell/core/cell.dart';
// import 'package:flutter_swipe_action_cell/core/controller.dart';
// import 'package:hive/hive.dart';
// import 'package:apps_factory/app/data/albums/mappers/hive_album_mapper.dart';

class AlbumWidget extends StatelessWidget {
  final AlbumModel album;

  const AlbumWidget({Key? key, required this.album}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //todo when album added to the cache - add tracks as well
    // final _swipeController = SwipeActionController();
    return
        // SwipeActionCell(
        // backgroundColor: Colors.white,
        // isDraggable: true,
        // controller: _swipeController,
        // key: ValueKey(album.mbid),
        // performsFirstActionWithFullSwipe: false,
        // trailingActions: [
        //   // SwipeAction(title: "delete", nestedAction: SwipeNestedAction(title: "confirm"), onTap: (handler) async {}),
        //   SwipeAction(
        //       color: Colors.lightGreen,
        //       title: 'Add',
        //       onTap: (handler) async {
        //         await handler(false);
        //         await Hive.box<HiveAlbumModel>('HiveAlbumModel').add(album.toHiveModel());
        //       }),
        // ],
        // child:
        GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AlbumScreen(album: album)),
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
                imageUrl: album.images
                    .firstWhere((e) => e.size == ImageSize.small)
                    .link,
                width: 78,
                height: 78,
                fit: BoxFit.cover,
                placeholder: (context, url) =>
                    const Center(child: Text('No image')),
              ),
            ),
          ],
        ),
      ),
      // ),
    );
  }
}
