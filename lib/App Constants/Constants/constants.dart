import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../App Images/app_images.dart';

class Constants {
  static String toolTip =
      'You can include any actions you need, such as updating state variables, navigating to a new screen, making API calls, or performing any other necessary operations based on the button press event.';

  static String noFactorFound = 'No Factor Found!\nTry adding a New Factor';
  static String noParametersFound =
      'No Parameter Found!\nTry adding a New Parameter';

  static var dropDownItems = [
    'Emoji',
    'Slider',
  ];

  static List<Map<String, dynamic>> nowDataList = [
    {
      'title': 'Professional',
      'img': AppImages.professional,
      'width': 100.w,
      'top': 90.h
    },
    {'title': 'Student', 'img': AppImages.student, 'width': 73.w, 'top': 165.h},
    {'title': 'Kid', 'img': AppImages.kid, 'width': 60.w, 'top': 140.h},
    {
      'title': 'Women',
      'img': AppImages.houseWife,
      'width': 80.w, 'top': 215.h
    },
    {
      'title': 'Business',
      'img': AppImages.business,
      'width': 80.w,
      'top': 180.h
    },
    {'title': 'Others', 'img': AppImages.others, 'width': 60.w, 'top': 73.h}
  ];



  static List<Map<String, dynamic>> professionalDataList = [
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
    {
      'title': 'Pilot',
      'img': AppImages.pilot,
      'imgIcon': AppImages.pilotIcon
    },
    {
      'title': 'Chef',
      'img': AppImages.chef,
      'imgIcon': AppImages.chefIcon
    },
    {
      'title': 'Chief Executives',
      'img': AppImages.ceo,
      'imgIcon': AppImages.ceoIcon
    },
    {
      'title': 'Health Professional',
      'img': AppImages.health,
      'imgIcon': AppImages.healthIcon
    },
  ];
  static List<Map<String, dynamic>> studentDataList = [
    {
      'title': 'Information Technology',
      'img': AppImages.it,
      'imgIcon': AppImages.itIcon
    },
    {
      'title': 'Islamic',
      'img': AppImages.islamic,
      'imgIcon': AppImages.islamicIcon
    },
    {
      'title': 'Creative Arts',
      'img': AppImages.creativeArts,
      'imgIcon': AppImages.creativeArtIcon
    },
    {
      'title': 'Physics',
      'img': AppImages.physics,
      'imgIcon': AppImages.physicsIcon
    },
    {
      'title': 'AI and Data Science',
      'img': AppImages.ai,
      'imgIcon': AppImages.aiDataSciIcon
    },
    {
      'title': 'Chemistry',
      'img': AppImages.chemistry,
      'imgIcon': AppImages.chemistryIcon
    },
    {
      'title': 'Medical',
      'img': AppImages.medical,
      'imgIcon': AppImages.medicalIcon
    },
    {
      'title': 'Health and Medicine',
      'img': AppImages.healthMedicine,
      'imgIcon': AppImages.healthMedicineIcon
    },
    {'title': 'Law',
      'img': AppImages.law,
      'imgIcon': AppImages.lawIcon
    },
    {'title': 'MBA',
      'img': AppImages.mba,
      'imgIcon': AppImages.mbaIcon
    },
    {
      'title': 'Fitness and Cre',
      'img': AppImages.fitnessCare,
      'imgIcon': AppImages.fitnessIcon
    },
    {
      'title': 'Travel and Hospitality',
      'img': AppImages.travel,
      'imgIcon': AppImages.travelIcon
    },
    {
      'title': 'Engineering',
      'img': AppImages.engineering,
      'imgIcon': AppImages.engineeringIcon
    },
    {
      'title': 'Designer',
      'img': AppImages.studentDesigner,
      'imgIcon': AppImages.stDesignerIcon
    },
    {
      'title': 'System Architect',
      'img': AppImages.architect,
      'imgIcon': AppImages.systemArchitectIcon
    },
    {
      'title': 'Business Management',
      'img': AppImages.management,
      'imgIcon': AppImages.businessManagIcon
    },
  ];
  static List<Map<String, dynamic>> kidDataList = [
    {
      'title': 'Normal Kids',
      'img': AppImages.normalKids,
      'imgIcon': AppImages.normalKidIcon
    },
    {
      'title': 'Abnormal Kids',
      'img': AppImages.abNormalKids,
      'imgIcon': AppImages.abnormalKidIcon
    },
    {
      'title': 'Diet',
      'img': AppImages.kidDiet,
      'imgIcon': AppImages.kidDietIcon
    },
    {
      'title': 'Growth',
      'img': AppImages.growth,
      'imgIcon': AppImages.kidGrowthIcon
    },
    {
      'title': 'Fun',
      'img': AppImages.fun,
      'imgIcon': AppImages.kidFunIcon
    },
    {
      'title': 'Study Routine',
      'img': AppImages.study,
      'imgIcon': AppImages.kidStudyIcon
    },
    {
      'title': 'School',
      'img': AppImages.school,
      'imgIcon': AppImages.kidSchoolIcon
    },
    {
      'title': 'Friendship',
      'img': AppImages.fiendship,
      'imgIcon': AppImages.kidFriendshipIcon
    },
  ];
  static List<Map<String, dynamic>> womenDataList = [
    {
      'title': 'Working Women',
      'img': AppImages.workingWomen,
      'imgIcon': AppImages.workingWomenIcon
    },
    {
      'title': 'House Wife',
      'img': AppImages.hWife,
      'imgIcon': AppImages.houseWifeIcon
    },
    {
      'title': 'Weight Issues',
      'img': AppImages.weightIssues,
      'imgIcon': AppImages.womenWeightIcon
    },
    {
      'title': 'Diet Issues',
      'img': AppImages.dietIssues,
      'imgIcon': AppImages.womenDietIcon
    },
    {
      'title': 'Relationship',
      'img': AppImages.womenRelationship,
      'imgIcon': AppImages.womenRelationshipIcon
    },
  ];
  static List<Map<String, dynamic>> businessDataList = [
    {
      'title': 'Food Business',
      'img': AppImages.foodBusiness,
      'imgIcon': AppImages.foodBusinessIcon
    },
    {
      'title': 'Cloth Business',
      'img': AppImages.clothBusiness,
      'imgIcon': AppImages.clothBusinessIcon
    },
    {
      'title': 'Shoe Business',
      'img': AppImages.shoeBusiness,
      'imgIcon': AppImages.shoeBusinessIcon
    },
    {
      'title': 'Automobile Business',
      'img': AppImages.automobileBusiness,
      'imgIcon': AppImages.automobileBusinessIcon
    },
    {
      'title': 'Moto Bikes Business',
      'img': AppImages.motoBikeBusiness,
      'imgIcon': AppImages.motoBikeBusinessIcon
    },
    {
      'title': 'Property Business',
      'img': AppImages.propertyBusiness,
      'imgIcon': AppImages.propertyBusinessIcon
    },
    {
      'title': 'Mobile Business',
      'img': AppImages.mobileBusiness,
      'imgIcon': AppImages.mobileBusinessIcon
    },
    {
      'title': 'Laptop Business',
      'img': AppImages.laptopBusiness,
      'imgIcon': AppImages.laptopBusinessIcon
    },
    {
      'title': 'Electronic Business',
      'img': AppImages.electronicBusiness,
      'imgIcon': AppImages.electronicBusinessIcon
    },
    {
      'title': 'Real Estate Business',
      'img': AppImages.realEstateBusiness,
      'imgIcon': AppImages.realEstateBusinessIcon
    },
    {
      'title': 'Automotive',
      'img': AppImages.automotiveBusiness,
      'imgIcon': AppImages.automotiveIcon
    },
    {
      'title': 'Business Support',
      'img': AppImages.businessSupport,
      'imgIcon': AppImages.businessSupportIcon
    },
    {
      'title': 'Computer & Electronic',
      'img': AppImages.comElectronicBusiness,
      'imgIcon': AppImages.compElectronicIcon
    },
    {
      'title': 'Construction & Contactors',
      'img': AppImages.construction,
      'imgIcon': AppImages.constructionIcon
    },
    {
      'title': 'Education',
      'img': AppImages.education,
      'imgIcon': AppImages.educationIcon
    },
    {
      'title': 'Entertainment',
      'img': AppImages.entertainment,
      'imgIcon': AppImages.entertainmentIcon
    },
    {
      'title': 'Food & Dining',
      'img': AppImages.foodDining,
      'imgIcon': AppImages.foodDiningIcon
    },
    {
      'title': 'Health & Medicine',
      'img': AppImages.businessHealthMedicine,
      'imgIcon': AppImages.medicineIcon
    },
    {
      'title': 'Home & Garden',
      'img': AppImages.homeGarden,
      'imgIcon': AppImages.gardenIcon
    },
    {
      'title': 'Legal & Financial',
      'img': AppImages.legalFinancial,
      'imgIcon': AppImages.legalFinanceIcon
    },
    {
      'title': 'Manufacturing & Wholesale',
      'img': AppImages.manufacturing,
      'imgIcon': AppImages.manufacturingIcon
    },
    {
      'title': 'Merchants (Retail)',
      'img': AppImages.merchant,
      'imgIcon': AppImages.merchantIcon
    },
    {
      'title': 'Miscellaneous',
      'img': AppImages.miscellaneous,
      'imgIcon': AppImages.miscellaneousIcon
    },
    {
      'title': 'Personal CAre & Services',
      'img': AppImages.personal,
      'imgIcon': AppImages.personalCareIcon
    },
  ];
  static List<Map<String, dynamic>> othersDataList = [
    {
      'title': 'Designer',
      'img': AppImages.designer,
      'imgIcon': AppImages.othersDesignerIcon
    },
    {
      'title': 'Banking',
      'img': AppImages.banking,
      'imgIcon': AppImages.bankingIcon
    },
    {
      'title': 'Beautician',
      'img': AppImages.beautician,
      'imgIcon': AppImages.beauticianIcon
    },
    {
      'title': 'Accountant',
      'img': AppImages.accountant,
      'imgIcon': AppImages.othersAccountantIcon
    },
    {
      'title': 'Actor/Actress',
      'img': AppImages.actor,
      'imgIcon': AppImages.actorIcon
    },
    {
      'title': 'Architect',
      'img': AppImages.othersArchitect,
      'imgIcon': AppImages.architectIcon
    },
    {
      'title': 'Author',
      'img': AppImages.author,
      'imgIcon': AppImages.authorIcon
    },
    {
      'title': 'Baker',
      'img': AppImages.baker,
      'imgIcon': AppImages.bakerIcon
    },
    {
      'title': 'Bus Driver',
      'img': AppImages.busDriver,
      'imgIcon': AppImages.busDriverIcon
    },
    {
      'title': 'Chef',
      'img': AppImages.chef,
      'imgIcon': AppImages.othersChefIcon
    },
    {
      'title': 'Fisherman',
      'img': AppImages.fisherman,
      'imgIcon': AppImages.fishermanIcon
    },
    {
      'title': 'Gardener',
      'img': AppImages.gardner,
      'imgIcon': AppImages.gardnerIcon
    },
    {
      'title': 'Librarian',
      'img': AppImages.librarian,
      'imgIcon': AppImages.librarianIcon
    },
    {
      'title': 'Nurse',
      'img': AppImages.nurse,
      'imgIcon': AppImages.nurseIcon
    },
    {
      'title': 'Painter',
      'img': AppImages.painter,
      'imgIcon': AppImages.painterIcon
    },
    {
      'title': 'Photographer',
      'img': AppImages.photographer,
      'imgIcon': AppImages.photographerIcon
    },
    {
      'title': 'Pilot',
      'img': AppImages.pilot,
      'imgIcon': AppImages.othersPilotIcon
    },
    {
      'title': 'Politician',
      'img': AppImages.politician,
      'imgIcon': AppImages.politicianIcon
    },
    {
      'title': 'Postman',
      'img': AppImages.postman,
      'imgIcon': AppImages.postmanIcon
    },
    {
      'title': 'Tailor',
      'img': AppImages.tailor,
      'imgIcon': AppImages.tailorIcon
    },
    {
      'title': 'Waiter',
      'img': AppImages.waiter,
      'imgIcon': AppImages.waiterIcon
    },
    {
      'title': 'School Administrator',
      'img': AppImages.schoolAdmin,
      'imgIcon': AppImages.schoolAdminIcon
    },
    {
      'title': 'Event Assistant',
      'img': AppImages.assestant,
      'imgIcon': AppImages.eventAssistantIcon
    },
    {
      'title': 'Cake Designer',
      'img': AppImages.cakeDesigner,
      'imgIcon': AppImages.cakeDesignerIcon
    },
    {
      'title': 'Jewellery Designer',
      'img': AppImages.jewelleryDesigner,
      'imgIcon': AppImages.jewelleryIcon
    },
    {
      'title': 'Dietitian',
      'img': AppImages.dietitian,
      'imgIcon': AppImages.dietitianIcon
    },
    {
      'title': 'Receptionist',
      'img': AppImages.recptionist,
      'imgIcon': AppImages.receptionistIcon
    },
    {
      'title': 'Restaurant Owner',
      'img': AppImages.owner,
      'imgIcon': AppImages.restaurantOwnerIcon
    },
  ];



}
