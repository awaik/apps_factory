// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_artist_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveArtistModelAdapter extends TypeAdapter<HiveArtistModel> {
  @override
  final int typeId = 0;

  @override
  HiveArtistModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveArtistModel(
      name: fields[0] as String,
      mbid: fields[1] as String,
      listeners: fields[2] as int,
      url: fields[3] as String,
      image: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, HiveArtistModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.mbid)
      ..writeByte(2)
      ..write(obj.listeners)
      ..writeByte(3)
      ..write(obj.url)
      ..writeByte(4)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveArtistModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
