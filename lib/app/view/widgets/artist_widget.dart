import 'package:apps_factory/app/domain/artist/artist_model.dart';
import 'package:flutter/material.dart';

class ArtistWidget extends StatelessWidget {
  final ArtistModel artist;

  const ArtistWidget({Key? key, required this.artist}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(child: Column(children: [
      Text(artist.name),
      Text(artist.listeners.toString())
    ],),);
  }
}
