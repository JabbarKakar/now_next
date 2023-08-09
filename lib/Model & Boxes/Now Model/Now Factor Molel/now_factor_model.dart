
import 'package:hive/hive.dart';
part 'now_factor_model.g.dart';

@HiveType(typeId: 2)
class NowFactorModel extends HiveObject {
  @HiveField(0)
  String nowFactor;

  @HiveField(1)
  String type;

  NowFactorModel({
    required this.nowFactor,
    required this.type,
  });
}
