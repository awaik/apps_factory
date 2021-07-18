import 'package:apps_factory/app/domain/album/album_model.dart';
import 'package:apps_factory/app/domain/errors/api_response.dart';
import 'package:apps_factory/app/domain/track/track_model.dart';
import 'package:apps_factory/app/view/album_screen/model/album_view_model.dart';
import 'package:apps_factory/app/view/widgets/album_widget.dart';
import 'package:apps_factory/app/view/widgets/track_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AlbumScreen extends StatefulWidget {
  final AlbumModel album;

  const AlbumScreen({required this.album});

  @override
  _AlbumScreenState createState() => _AlbumScreenState();
}

class _AlbumScreenState extends State<AlbumScreen> {
  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      if (widget.album.mbid.isNotEmpty) {
        Provider.of<AlbumViewModel>(context, listen: false)
            .getTracks(widget.album.mbid);
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ApiResponse apiResponse =
        Provider.of<AlbumViewModel>(context).response;
    Widget getTrackWidget(BuildContext context, ApiResponse apiResponse) {
      switch (apiResponse.status) {
        case Status.loading:
          return const Center(child: CircularProgressIndicator());
        case Status.completed:
          final List<TrackModel> albums = apiResponse.data as List<TrackModel>;
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
                            return TrackWidget(track: albums[index]);
                          },
                          separatorBuilder: (context, index) {
                            return const Divider();
                          },
                        ),
                      ),
                    ],
                  ),
                )
              : const Center(
                  child: Text('Can\'t find albums for this request'));
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
        title: const Text('Album info'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
            child: AlbumWidget(
              album: widget.album,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 00, 10, 20),
            child: Text('Tracks', style: Theme.of(context).textTheme.headline4),
          ),
          Expanded(child: getTrackWidget(context, apiResponse)),
        ],
      ),
    );
  }
}
