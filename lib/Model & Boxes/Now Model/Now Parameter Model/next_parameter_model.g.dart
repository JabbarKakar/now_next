// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'next_parameter_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NowParameterModelAdapter extends TypeAdapter<NowParameterModel> {
  @override
  final int typeId = 3;

  @override
  NowParameterModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NowParameterModel(
      nowParameter: fields[0] as String,
      nowEmoji: fields[1] as String,
      nowFaceExpression: fields[2] as String,
      nowType: fields[3] as dynamic,
      nowFactorTitle: fields[4] as dynamic,
      nowDate: fields[5] as dynamic,
      nowTime: fields[6] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, NowParameterModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.nowParameter)
      ..writeByte(1)
      ..write(obj.nowEmoji)
      ..writeByte(2)
      ..write(obj.nowFaceExpression)
      ..writeByte(3)
      ..write(obj.nowType)
      ..writeByte(4)
      ..write(obj.nowFactorTitle)
      ..writeByte(5)
      ..write(obj.nowDate)
      ..writeByte(6)
      ..write(obj.nowTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NowParameterModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
