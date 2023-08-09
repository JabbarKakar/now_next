import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'App Constants/Constants/constants.dart';
import 'Components/custom_container.dart';
import 'Views/Now Module/Show All Now Factors View/show_all_now_factors_view.dart';

class SearchView extends SearchDelegate {
  final List<Map<String, dynamic>> _dataList = Constants.professionalDataList;

  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    List<Map<String, dynamic>> matchQuery = [];
    for (var searched in _dataList) {
      var title = searched['title'].toString();
      if (title.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(searched);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        final result = matchQuery[index];
        var title = result['title'].toString();
        var image = result['img'];
        var svgImage = result['imgIcon'];
        return CustomContainer(
          onTap: () {
            Get.to(() => ShowAllNowFactorView(type: title.toString()));
          },
          image: image,
          svgImage: svgImage,
          title: title,
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    List<Map<String, dynamic>> matchQuery = [];
    for (var searched in _dataList) {
      var title = searched['title'].toString();
      if (title.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(searched);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        final result = matchQuery[index];
        var title = result['title'].toString();
        var image = result['img'];
        var svgImage = result['imgIcon'];
        return CustomContainer(
          onTap: () {
            Get.to(() => ShowAllNowFactorView(type: title.toString()));
          },
          image: image,
          svgImage: svgImage,
          title: title,
        );
      },
    );
  }
}
