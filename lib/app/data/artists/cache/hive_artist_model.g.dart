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
    return HiveArtistModel();
  }

  @override
  void write(BinaryWriter writer, HiveArtistModel obj) {
    writer..writeByte(0);
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
