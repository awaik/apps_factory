import 'package:apps_factory/app/data/albums/cache/hive_album_model.dart';
import 'package:apps_factory/app/data/artists/cache/hive_artist_model.dart';
import 'package:apps_factory/app/data/tracks/cache/hive_track_model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'app/internal/app.dart';

Future main() async {
  // register cache models
  await Hive.initFlutter();
  Hive
    ..registerAdapter(HiveArtistModelAdapter())
    ..registerAdapter(HiveAlbumModelAdapter())
    ..registerAdapter(HiveTrackModelAdapter());

  //open cache boxes
  await Hive.openBox<HiveArtistModel>('HiveArtistModel');
  await Hive.openBox<HiveAlbumModel>('HiveAlbumModel');

  runApp(App());
}
