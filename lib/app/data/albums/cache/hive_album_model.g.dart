// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_album_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveAlbumModelAdapter extends TypeAdapter<HiveAlbumModel> {
  @override
  final int typeId = 1;

  @override
  HiveAlbumModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveAlbumModel(
      name: fields[0] as String,
      playcount: fields[1] as int,
      mbid: fields[2] as String,
      url: fields[3] as String,
      image: fields[4] as String,
      artist: fields[5] as HiveArtistModel,
    );
  }

  @override
  void write(BinaryWriter writer, HiveAlbumModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.playcount)
      ..writeByte(2)
      ..write(obj.mbid)
      ..writeByte(3)
      ..write(obj.url)
      ..writeByte(4)
      ..write(obj.image)
      ..writeByte(5)
      ..write(obj.artist);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveAlbumModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
