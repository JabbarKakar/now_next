// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'now_factor_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NowFactorModelAdapter extends TypeAdapter<NowFactorModel> {
  @override
  final int typeId = 2;

  @override
  NowFactorModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NowFactorModel(
      nowFactor: fields[0] as String,
      type: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, NowFactorModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.nowFactor)
      ..writeByte(1)
      ..write(obj.type);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NowFactorModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
