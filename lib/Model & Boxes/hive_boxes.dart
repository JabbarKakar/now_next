import 'package:hive/hive.dart';
import 'package:now_next/Model%20&%20Boxes/Now%20Model/Now%20Factor%20Molel/now_factor_model.dart';
import 'package:now_next/Model%20&%20Boxes/Now%20Model/Now%20Parameter%20Model/next_parameter_model.dart';

import 'Next Model/Next Factor Model/next_factor_model.dart';
import 'Next Model/Next Parameter Model/next_parameter_model.dart';


class HiveBoxes {
  static Box<NextFactorModel> nextFactorData() => Hive.box<NextFactorModel>('NextFactorBox');
  static Box<NextParameterModel> nextParameterData() => Hive.box<NextParameterModel>('NextParameterBox');

  static Box<NowFactorModel> nowFactorData() => Hive.box<NowFactorModel>('NowFactorBox');
  static Box<NowParameterModel> nowParameterData() => Hive.box<NowParameterModel>('NowParameterBox');
}



