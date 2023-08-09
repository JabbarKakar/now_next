// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'next_factor_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NextFactorModelAdapter extends TypeAdapter<NextFactorModel> {
  @override
  final int typeId = 0;

  @override
  NextFactorModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NextFactorModel(
      factor: fields[0] as String,
      type: fields[1] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, NextFactorModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.factor)
      ..writeByte(1)
      ..write(obj.type);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NextFactorModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
