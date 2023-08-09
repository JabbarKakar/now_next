
import 'package:hive/hive.dart';
part 'next_parameter_model.g.dart';
@HiveType(typeId: 1)
class NextParameterModel extends HiveObject {
  @HiveField(0)
  String parameter;

  @HiveField(1)
  String emoji;

  @HiveField(2)
  String faceExpression;

  @HiveField(3)
  dynamic type;

  @HiveField(4)
  dynamic factorTitle;

  @HiveField(5)
  dynamic date;

  @HiveField(6)
  dynamic time;

  @HiveField(7)
  dynamic slider;


  NextParameterModel({
    required this.parameter,
    required this.emoji,
    required this.faceExpression,
    required this.type,
    required this.factorTitle,
    required this.date,
    required this.time,
    required this.slider,
  });
}
