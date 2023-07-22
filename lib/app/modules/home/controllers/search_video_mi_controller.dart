// SearchVideoMIController

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fit_chauzar/app/data/models/video.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchVideoMIController extends GetxController {
  final Dio dio = Dio();
  final String apiUrl1 =
      "https://development.inhealth.co.id/ft-svc/api/GeneratorInhealthEncryptDataWithPub";
  final String apiUrl2 =
      "https://development.inhealth.co.id/ft-svc/api/NWGetTrxWebContent";
  var content = <Video>[].obs;
  var searchText = ''.obs;
  var isLoading = true.obs;
  TextEditingController inputSearch = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    fetchDataFromApi();
  }

  void fetchDataFromApi() async {
    try {
      final response = await dio.post(apiUrl1, data: {
        "username": "6285333111623",
        "nomorKartuInhealth": "1001538370697",
        "udid": "06abd25e57a14579",
        "deviceType": "Android",
        "webContentTittleTp": "",
        "offset": 0,
        "limit": 100
      });
      var responseDat = await Dio().post(
          "https://development.inhealth.co.id/ft-svc/api/NWGetTrxWebContent",
          data: response.data.toString().replaceAll('"', '\\"'));

      final List<dynamic> responseData =
          (json.decode(responseDat.data) as Map<String, dynamic>)["datas"];
      final List<Video> filteredVideoMIList = responseData
          .map((data) => Video.fromJson(data))
          .where((title) => title.webContentTittleTpNm == "Video MI")
          .toList();

      content.assignAll(filteredVideoMIList);
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching data from API: $e');
      }
    } finally {
      isLoading.value = false;
    }
  }

  List<Video> get filteredData {
    // Jika searchText kosong, tampilkan semua data
    if (searchText.isEmpty) return content;

    // Jika searchText tidak kosong, filter data berdasarkan nilai searchText
    return content
        .where((title) => title.webContentTittle.toLowerCase()
            .contains(searchText.value.toLowerCase()))
        .toList();
  }
}
