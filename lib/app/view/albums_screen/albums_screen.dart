import 'package:apps_factory/app/domain/album/album_model.dart';
import 'package:apps_factory/app/domain/artist/artist_model.dart';
import 'package:apps_factory/app/domain/errors/api_response.dart';
import 'package:apps_factory/app/view/widgets/album_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model/albums_view_model.dart';

class AlbumsScreen extends StatefulWidget {
  final ArtistModel artist;

  const AlbumsScreen({required this.artist});

  @override
  _AlbumsScreenState createState() => _AlbumsScreenState();
}

class _AlbumsScreenState extends State<AlbumsScreen> {
  final _inputController = TextEditingController();

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      if (widget.artist.mbid.isNotEmpty) {
        Provider.of<AlbumsViewModel>(context, listen: false).getAlbums(widget.artist.mbid);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _inputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ApiResponse apiResponse = Provider.of<AlbumsViewModel>(context).response;
    Widget getAlbumWidget(BuildContext context, ApiResponse apiResponse) {
      switch (apiResponse.status) {
        case Status.loading:
          return const Center(child: CircularProgressIndicator());
        case Status.completed:
          final List<AlbumModel> albums = apiResponse.data as List<AlbumModel>;
          return albums.isNotEmpty
              ? Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        flex: 8,
                        child: ListView.separated(
                          itemCount: albums.length,
                          itemBuilder: (context, index) {
                            return AlbumWidget(album: albums[index]);
                          },
                          separatorBuilder: (context, index) {
                            return const Divider();
                          },
                        ),
                      ),
                    ],
                  ),
                )
              : const Center(child: Text('Can\'t find albums for this request'));
        case Status.error:
          return Center(
            child: Text(apiResponse.data),
          );
        case Status.initial:
        default:
          return const Center(
            child: Text(''),
          );
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Top Albums'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
            child: Align(
                alignment: Alignment.center,
                child: Text(
                  widget.artist.name,
                  style: Theme.of(context).textTheme.headline4,
                )),
          ),
          Expanded(child: getAlbumWidget(context, apiResponse)),
        ],
      ),
    );
  }
}
