import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:now_next/App%20Constants/Constants/constants.dart';

import '../../../Components/custom_container.dart';
import '../Show All Factors View/show_all_factors_view.dart';


class NextListView extends StatefulWidget {
  final String listTitle;
  const NextListView({Key? key, required this.listTitle}) : super(key: key);

  @override
  State<NextListView> createState() => _NextListViewState();
}

class _NextListViewState extends State<NextListView> {

  String _searchQueryProfessional = '';
  String _searchQueryStudent = '';
  String _searchQueryKid = '';
  String _searchQueryWomen = '';
  String _searchQueryBusiness = '';
  String _searchQueryOthers = '';


  List<Map<String, dynamic>> _filterDataProfessional(String query) {
    return Constants.professionalDataList
        .where((item) => item['title'].toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  List<Map<String, dynamic>> _filterDataStudent(String query) {
    return Constants.studentDataList
        .where((item) => item['title'].toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  List<Map<String, dynamic>> _filterDataKid(String query) {
    return Constants.kidDataList
        .where((item) => item['title'].toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  List<Map<String, dynamic>> _filterDataWomen(String query) {
    return Constants.womenDataList
        .where((item) => item['title'].toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  List<Map<String, dynamic>> _filterDataBusiness(String query) {
    return Constants.businessDataList
        .where((item) => item['title'].toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  List<Map<String, dynamic>> _filterDataOthers(String query) {
    return Constants.othersDataList
        .where((item) => item['title'].toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
  // MyState myState = MyState();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.listTitle),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black,),
                  borderRadius: BorderRadius.circular(10.sp),
                ),
                child: TextFormField(
                  // controller: myState.nowSearchController,
                  onChanged: (value){
                    setState(() {
                      switch (widget.listTitle) {
                        case 'Professional':
                          _searchQueryProfessional = value;
                          break;
                        case 'Student':
                          _searchQueryStudent = value;
                          break;
                        case 'Kid':
                          _searchQueryKid = value;
                          break;
                        case 'Women':
                          _searchQueryWomen = value;
                          break;
                        case 'Business':
                          _searchQueryBusiness = value;
                          break;
                        case 'Others':
                          _searchQueryOthers = value;
                          break;
                        default:
                          break;
                      }
                    });
                  },
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                      hintText: 'Search',
                      suffixIcon: Icon(Icons.search),
                      border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: 15.h,),
              SizedBox(
                height: 552.h,
                width: double.infinity,
                child: (() {
                  switch (widget.listTitle) {
                    case 'Professional':
                      return ListView.builder(
                        itemCount: _filterDataProfessional(_searchQueryProfessional).length,
                        itemBuilder: (BuildContext context, int index) {
                          // final items = Constants.professionalDataList[index];
                          final items = _filterDataProfessional(_searchQueryProfessional)[index];

                          return CustomContainer(
                              onTap: () {
                                Get.to(() => ShowAllFactorView(type: items['title']));
                              },
                              image: items['img'],
                              svgImage: items['imgIcon'],
                              title: items['title']);
                        },
                      );
                    case 'Student':
                      return ListView.builder(
                        itemCount: _filterDataStudent(_searchQueryStudent).length,
                        itemBuilder: (BuildContext context, int index) {
                          // final items = Constants.studentDataList[index];
                          final items = _filterDataStudent(_searchQueryStudent)[index];

                          return CustomContainer(
                            onTap: (){
                              Get.to(() => ShowAllFactorView(type: items['title']));
                            },
                            image: items['img'],
                            svgImage: items['imgIcon'],
                            title: items['title'],
                          );
                        },
                      );
                    case 'Kid':
                      return ListView.builder(
                        itemCount: _filterDataKid(_searchQueryKid).length,
                        itemBuilder: (BuildContext context, int index) {
                          // final items = Constants.kidDataList[index];
                          final items = _filterDataKid(_searchQueryKid)[index];

                          return CustomContainer(
                            onTap: (){
                              Get.to(() => ShowAllFactorView(type: items['title']));
                            },
                            image: items['img'],
                            svgImage: items['imgIcon'],
                            title: items['title'],
                          );
                        },
                      );
                    case 'Women':
                      return ListView.builder(
                        itemCount: _filterDataWomen(_searchQueryWomen).length,
                        itemBuilder: (BuildContext context, int index) {
                          // final items = Constants.womenDataList[index];
                          final items = _filterDataWomen(_searchQueryWomen)[index];

                          return CustomContainer(
                            onTap: (){
                              Get.to(() => ShowAllFactorView(type: items['title']));
                            },
                            image: items['img'],
                            svgImage: items['imgIcon'],
                            title: items['title'],
                          );
                        },
                      );
                    case 'Business':
                      return ListView.builder(
                        itemCount: _filterDataBusiness(_searchQueryBusiness).length,
                        itemBuilder: (BuildContext context, int index) {
                          // final items = Constants.businessDataList[index];
                          final items = _filterDataBusiness(_searchQueryBusiness)[index];

                          return CustomContainer(
                            onTap: (){
                              Get.to(() => ShowAllFactorView(type: items['title']));
                            },
                            image: items['img'],
                            svgImage: items['imgIcon'],
                            title: items['title'],
                          );
                        },
                      );
                    case 'Others':
                      return ListView.builder(
                        itemCount: _filterDataOthers(_searchQueryOthers).length,
                        itemBuilder: (BuildContext context, int index) {
                          // final items = Constants.othersDataList[index];
                          final items = _filterDataOthers(_searchQueryOthers)[index];

                          return CustomContainer(
                            onTap: (){
                              Get.to(() => ShowAllFactorView(type: items['title']));
                            },
                            image: items['img'],
                            svgImage: items['imgIcon'],
                            title: items['title'],
                          );
                        },
                      );
                    default:
                      return const SizedBox.shrink();
                  }
                })(),
              )
            ],
          ),
        ),
      ),
    );
  }
}


