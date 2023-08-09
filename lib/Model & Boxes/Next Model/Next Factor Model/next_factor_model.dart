
import 'package:hive/hive.dart';
part 'next_factor_model.g.dart';
@HiveType(typeId: 0)
class NextFactorModel extends HiveObject {
  @HiveField(0)
  String factor;

  @HiveField(1)
  dynamic type;

  NextFactorModel({
    required this.factor,
    required this.type,
  });
}
