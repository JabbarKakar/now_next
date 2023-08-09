
import 'package:hive/hive.dart';
part 'next_parameter_model.g.dart';
@HiveType(typeId: 3)
class NowParameterModel extends HiveObject {
  @HiveField(0)
  String nowParameter;

  @HiveField(1)
  String nowEmoji;

  @HiveField(2)
  String nowFaceExpression;

  @HiveField(3)
  dynamic nowType;

  @HiveField(4)
  dynamic nowFactorTitle;

  @HiveField(5)
  dynamic nowDate;

  @HiveField(6)
  dynamic nowTime;

  NowParameterModel({
    required this.nowParameter,
    required this.nowEmoji,
    required this.nowFaceExpression,
    required this.nowType,
    required this.nowFactorTitle,
    required this.nowDate,
    required this.nowTime,
  });
}
