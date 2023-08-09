import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:now_next/Components/Container1.dart';
import 'package:now_next/Components/container2.dart';
import 'package:now_next/Components/container3.dart';
import 'package:now_next/Model%20&%20Boxes/Next%20Model/Next%20Parameter%20Model/next_parameter_model.dart';
import 'package:now_next/Model%20&%20Boxes/Now%20Model/Now%20Factor%20Molel/now_factor_model.dart';
import 'package:now_next/Views/Selection%20View/selection_view.dart';

import '../App Constants/App Images/app_images.dart';
import '../Model & Boxes/Next Model/Next Factor Model/next_factor_model.dart';
import '../Model & Boxes/Now Model/Now Parameter Model/next_parameter_model.dart';
import '../Model & Boxes/hive_boxes.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

import '../main.dart';

class MyState extends ChangeNotifier {
  /// Controllers
  final factorController = TextEditingController();
  final parameterController = TextEditingController();
  final updateController = TextEditingController();

  final nowFactorController = TextEditingController();
  final nowParameterController = TextEditingController();

  final nowSearchController = TextEditingController();


  String param = "";
  void changeParam({required String paramValue}) {
    param = paramValue;
    notifyListeners();
  }

  /// Form Key
  final formKey = GlobalKey<FormState>();
  final parameterFormKey = GlobalKey<FormState>();

  int _currentPage = 0;
  int get currentPage => _currentPage;

  final PageController _pageController = PageController();
  PageController get pageController => _pageController;

  /// Next page method
  void nextPage([int? index]) {
    if (index != null) {
      _currentPage = index;
    } else {
      if (_currentPage < screenList.length - 1) {
        _currentPage++;
      } else {
        // Navigate to the next screen
        Get.to(const SelectionView(), transition: Transition.fadeIn);
      }
    }
    _pageController.animateToPage(
      _currentPage,
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease,
    );
    notifyListeners();
  }

  /// DropDown Item Selection
  late String _selectedItem = 'Emoji';
  String get selectedItem => _selectedItem;

  set selectedItem(String value) {
    _selectedItem = value;
    notifyListeners();
  }

  /// OnBoarding Containers List
  final List<Widget> screenList = [
    const Container1(),
    const Container2(),
    const Container3(),
  ];

  /// Next Categories List
  List<Map<String, dynamic>> nextDataList = [
    {
      'title': 'Teacher',
      'img': AppImages.teacher,
      'imgIcon': AppImages.teacherIcon
    },
    {
      'title': 'Doctor',
      'img': AppImages.doctor,
      'imgIcon': AppImages.doctorIcon
    },
    {
      'title': 'Lawyer',
      'img': AppImages.lawyer,
      'imgIcon': AppImages.lawyerIcon
    },
    {
      'title': 'Designer',
      'img': AppImages.designer,
      'imgIcon': AppImages.designerIcon
    },
    {
      'title': 'Artist',
      'img': AppImages.artist,
      'imgIcon': AppImages.artistIcon
    },
    {
      'title': 'Scientist',
      'img': AppImages.scientist,
      'imgIcon': AppImages.scientistIcon
    },
    {
      'title': 'Accountant',
      'img': AppImages.accountant,
      'imgIcon': AppImages.accountantIcon
    },
    {
      'title': 'Policemen',
      'img': AppImages.police,
      'imgIcon': AppImages.policeIcon
    },
    {'title': 'Pilot', 'img': AppImages.pilot, 'imgIcon': AppImages.pilotIcon},
    {'title': 'Chef', 'img': AppImages.chef, 'imgIcon': AppImages.chefIcon},
    {
      'title': 'Health Professional',
      'img': AppImages.health,
      'imgIcon': AppImages.healthIcon
    },
  ];

  /// Emojis List
  List<Map<String, dynamic>> emojisDataList = [
    {
      'emoji': '\u{1F616}',
      'title': 'Bad',
      'textColor': const Color(0xffFF002E)
    },
    {'emoji': '\u{1F60C}', 'title': 'Ok', 'textColor': const Color(0xffFDE030)},
    {
      'emoji': '\u{1F60A}',
      'title': 'Good',
      'textColor': const Color(0xff6CFF12)
    },
    {
      'emoji': '\u{1F600}',
      'title': 'Great',
      'textColor': const Color(0xff12FF8D)
    },
    {
      'emoji': '\u{1F60D}',
      'title': 'Excellent',
      'textColor': const Color(0xff363535)
    },
  ];

  /// Emoji Container Selection
  int selectedContainerIndex = 0;
  void selectContainer(int index) {
    selectedContainerIndex = index;
    notifyListeners();
  }

  /// Save Next Factor Data to Hive
  void saveNextFactorData(
      {required String type, required BuildContext context}) {
    if (kDebugMode) {
      print("this is type value $type");
    }
    final data = NextFactorModel(factor: factorController.text, type: type);
    final box = HiveBoxes.nextFactorData();
    box.add(data);
    data.save();
    Get.snackbar('Factor Added!!!', 'New Factor is Added',
        backgroundColor: Colors.yellow);
    Navigator.pop(context);
  }

  /// Logic for Showing data of Next Factor
  late Box<NextFactorModel> nextFactorBox;
  bool nextFactorAlreadyExist = true;
  void openNextFactorHiveBox({required String type}) async {
    await Hive.initFlutter();
    await Hive.openBox<NextFactorModel>('NextFactorBox');
    nextFactorBox = Hive.box<NextFactorModel>('NextFactorBox');
    checkNextFactor(type: type);
    notifyListeners();
  }

  /// Logic for Showing data of Next Factor
  void checkNextFactor({required String type}) {
    nextFactorAlreadyExist = true; // Set the flag to true initially
    for (int i = 0; i < nextFactorBox.length; i++) {
      NextFactorModel? factor = nextFactorBox.getAt(i);
      if (factor!.type == type) {
        nextFactorAlreadyExist = false;
        break;
      }
    }
    notifyListeners();
  }

  /// Logic for Showing data of Now Factor
  late Box<NowFactorModel> nowFactorBox;
  bool nowFactorAlreadyExist = true;
  void openNowFactorHiveBox({required String type}) async {
    await Hive.initFlutter();
    await Hive.openBox<NowFactorModel>('NowFactorBox');
    nowFactorBox = Hive.box<NowFactorModel>('NowFactorBox');
    checkNowFactor(type: type);
    notifyListeners();
  }

  /// Logic for Showing data of Now Factor
  void checkNowFactor({required String type}) {
    nowFactorAlreadyExist = true; // Set the flag to true initially
    for (int i = 0; i < nowFactorBox.length; i++) {
      NowFactorModel? factor = nowFactorBox.getAt(i);
      if (factor!.type == type) {
        nowFactorAlreadyExist = false;
        break;
      }
    }
    notifyListeners();
  }

  /// Save Next Parameter Data to Hive
  void saveNextParameterData(
      {required BuildContext context,
      required String type,
      required String emoji,
      required String title,
      required String parameter,
      required String factorTitle,
      required String date,
      required String time,
      String? slider}) {
    final data = NextParameterModel(
        type: type,
        parameter: parameter,
        emoji: emoji,
        faceExpression: title,
        factorTitle: factorTitle,
        date: date,
        time: time,
        slider: slider);
    final box = HiveBoxes.nextParameterData();
    box.add(data);
    data.save();
    Get.snackbar('Parameter Added!!!', 'New Parameter is Added',
        backgroundColor: Colors.yellow);
    Navigator.pop(context);
  }

  /// Slider
  double _sliderValue = 0.0;
  double get sliderValue => _sliderValue;

  set sliderValue(double value) {
    _sliderValue = value;
    notifyListeners();
  }

  /// Date selection
  DateTime? _selectedDate;
  DateTime? get selectedDate => _selectedDate;
  set selectedDate(DateTime? value) {
    _selectedDate = value;
    notifyListeners();
  }

  /// Time selection
  TimeOfDay? _selectedTime;
  TimeOfDay? get selectedTime => _selectedTime;
  set selectedTime(TimeOfDay? value) {
    _selectedTime = value;
    notifyListeners();
  }

  /// Save Now Factor Data to Hive
  void saveNowFactorData(
      {required BuildContext context, required String type}) {
    final data =
        NowFactorModel(nowFactor: nowFactorController.text, type: type);
    final box = HiveBoxes.nowFactorData();
    box.add(data);
    data.save();
    Get.snackbar('Factor Added!!!', 'New Factor is Added',
        backgroundColor: Colors.yellow);
    Navigator.pop(context);
  }

  /// Save Next Parameter Data to Hive
  void saveNowParameterData(
      {required BuildContext context,
      required String nowType,
      required String nowEmoji,
      required String nowTitle,
      required String nowParameter,
      required String nowFactorTitle,
      required String nowDate,
      required String nowTime}) {
    final data = NowParameterModel(
        nowParameter: nowParameter,
        nowEmoji: nowEmoji,
        nowFaceExpression: nowTitle,
        nowType: nowType,
        nowFactorTitle: nowFactorTitle,
        nowDate: nowDate,
        nowTime: nowTime);
    final box = HiveBoxes.nowParameterData();
    box.add(data);
    data.save();
    Get.snackbar('Parameter Added!!!', 'New Parameter is Added',
        backgroundColor: Colors.yellow);
    Navigator.pop(context);
  }

  /// Time zone.....
  void initializeTimezone() {
    tz.initializeTimeZones();
    tz.setLocalLocation(tz.getLocation('Asia/Karachi'));
  }

  /// Local Notification.....
  Future<void> scheduleNotification({required String title, required String body}) async {
    // final selectedDate = selectedDate;
    // final selectedTime = myStateProvider.selectedTime;

    if (selectedDate != null && selectedTime != null) {
      final scheduledDateTime = tz.TZDateTime(
        tz.local,
        selectedDate!.year,
        selectedDate!.month,
        selectedDate!.day,
        selectedTime!.hour,
        selectedTime!.minute,
      );

      await flutterLocalNotificationsPlugin.zonedSchedule(
        0,
        title,
        body,
        scheduledDateTime,
        const NotificationDetails(
          android: AndroidNotificationDetails(
            'your_channel_id', // Replace with your own channel ID
            'Your Channel Name', // Replace with your own channel name
            importance: Importance.max,
            priority: Priority.high,
            playSound: true,
            enableVibration: true,
            enableLights: true,
            setAsGroupSummary: true,
          ),
          iOS: DarwinNotificationDetails(
            presentSound: true,
            presentBadge: true,
            presentAlert: true,
          ),
        ),
        androidAllowWhileIdle: true,
        //payload: NotificationView(),
        uiLocalNotificationDateInterpretation:
        UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.time,
      );
    }
  }



  String _searchQueryProfessional = '';
  String _searchQueryStudent = '';
  String _searchQueryKid = '';
  String _searchQueryWomen = '';
  String _searchQueryBusiness = '';
  String _searchQueryOthers = '';

  String get searchQueryProfessional => _searchQueryProfessional;
  String get searchQueryStudent => _searchQueryStudent;
  String get searchQueryKid => _searchQueryKid;
  String get searchQueryWomen => _searchQueryWomen;
  String get searchQueryBusiness => _searchQueryBusiness;
  String get searchQueryOthers => _searchQueryOthers;

  void setSearchQuery(String query, String listTitle) {
    switch (listTitle) {
      case 'Professional':
        _searchQueryProfessional = query;
        break;
      case 'Student':
        _searchQueryStudent = query;
        break;
      case 'Kid':
        _searchQueryKid = query;
        break;
      case 'Women':
        _searchQueryWomen = query;
        break;
      case 'Business':
        _searchQueryBusiness = query;
        break;
      case 'Others':
        _searchQueryOthers = query;
        break;
      default:
        break;
    }
    notifyListeners();
  }





}
