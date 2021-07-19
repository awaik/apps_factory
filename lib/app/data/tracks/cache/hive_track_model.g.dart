// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_track_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveTrackModelAdapter extends TypeAdapter<HiveTrackModel> {
  @override
  final int typeId = 2;

  @override
  HiveTrackModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveTrackModel(
      name: fields[0] as String,
      url: fields[1] as String,
      rank: fields[2] as int,
      duration: fields[3] as int,
      artist: fields[4] as HiveArtistModel,
    );
  }

  @override
  void write(BinaryWriter writer, HiveTrackModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.url)
      ..writeByte(2)
      ..write(obj.rank)
      ..writeByte(3)
      ..write(obj.duration)
      ..writeByte(4)
      ..write(obj.artist);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveTrackModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
