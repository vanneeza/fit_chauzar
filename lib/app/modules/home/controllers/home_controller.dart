import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fit_chauzar/app/data/models/video.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
}

class GetVideoMI extends GetxController{
  var getVideo = <Video>[].obs;
  var isLoading = true.obs;
  
  @override
  void onInit() {
    super.onInit();
    fetchVideos();
  }

Future<void> fetchVideos() async {
    try {
      var resToken = await Dio().post(
        "https://development.inhealth.co.id/ft-svc/api/GeneratorInhealthEncryptDataWithPub",
        data: {
          "username": "6285333111623",
          "nomorKartuInhealth": "1001538370697",
          "udid": "06abd25e57a14579",
          "deviceType": "Android",
          "webContentTittleTp": "",
          "offset": 0,
          "limit": 100
        },
      );

      var getResponseToken = resToken.toString().replaceAll('"', '\\"');

      var data = await Dio().post(
        "https://development.inhealth.co.id/ft-svc/api/NWGetTrxWebContent",
        data: getResponseToken,
      );
      Map<String, dynamic> datas = json.decode(data.data);

      List<dynamic> dataList = datas["datas"];
      if (dataList.isNotEmpty) {
        List<dynamic> videoData = dataList.where((data) => data["webContentTittleTpNm"] == "Video MI").toList();
      

        if (videoData.isNotEmpty) {
          getVideo.assignAll(
            videoData.map((data) => Video.fromJson(data)).toList(),
          );
        } else {
          if (kDebugMode) {
            print("Error: video mi mana ?");
          }
        }
      } else {
        if (kDebugMode) {
          print("Error: kosong data.");
        }
      }
    } catch (error) {
      if (kDebugMode) {
        print("Error fetching data: $error");
      }
    } finally {
      isLoading.value = false;
    }
  }

}

class GetProdukAxa extends GetxController{
  var getVideoProdukAxa = <Video>[].obs;
  var isLoading = true.obs;
  
  @override
  void onInit() {
    super.onInit();
    fetchVideos();
  }

Future<void> fetchVideos() async {
    try {
      var resToken = await Dio().post(
        "https://development.inhealth.co.id/ft-svc/api/GeneratorInhealthEncryptDataWithPub",
        data: {
          "username": "6285333111623",
          "nomorKartuInhealth": "1001538370697",
          "udid": "06abd25e57a14579",
          "deviceType": "Android",
          "webContentTittleTp": "",
          "offset": 0,
          "limit": 100
        },
      );

      var getResponseToken = resToken.toString().replaceAll('"', '\\"');

      var data = await Dio().post(
        "https://development.inhealth.co.id/ft-svc/api/NWGetTrxWebContent",
        data: getResponseToken,
      );
      Map<String, dynamic> datas = json.decode(data.data);

      List<dynamic> dataList = datas["datas"];
      if (dataList.isNotEmpty) {
        List<dynamic> videoData = dataList.where((data) => data["webContentTittleTpNm"] == "Produk Axa Financial Services").toList();
      

        if (videoData.isNotEmpty) {
          getVideoProdukAxa.assignAll(
            videoData.map((data) => Video.fromJson(data)).toList(),
          );
        } else {
          if (kDebugMode) {
            print("Error: Produk Axa Financial Services ?");
          }
        }
      } else {
        if (kDebugMode) {
          print("Error: kosong data.");
        }
      }
    } catch (error) {
      if (kDebugMode) {
        print("Error fetching data: $error");
      }
    } finally {
      isLoading.value = false;
    }
  }

}
