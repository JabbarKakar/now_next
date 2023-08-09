// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'next_parameter_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NextParameterModelAdapter extends TypeAdapter<NextParameterModel> {
  @override
  final int typeId = 1;

  @override
  NextParameterModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NextParameterModel(
      parameter: fields[0] as String,
      emoji: fields[1] as String,
      faceExpression: fields[2] as String,
      type: fields[3] as dynamic,
      factorTitle: fields[4] as dynamic,
      date: fields[5] as dynamic,
      time: fields[6] as dynamic,
      slider: fields[7] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, NextParameterModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.parameter)
      ..writeByte(1)
      ..write(obj.emoji)
      ..writeByte(2)
      ..write(obj.faceExpression)
      ..writeByte(3)
      ..write(obj.type)
      ..writeByte(4)
      ..write(obj.factorTitle)
      ..writeByte(5)
      ..write(obj.date)
      ..writeByte(6)
      ..write(obj.time)
      ..writeByte(7)
      ..write(obj.slider);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NextParameterModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
