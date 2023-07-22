import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/models/video.dart';

import '../controllers/home_controller.dart';
import '../controllers/search_video_mi_controller.dart';
import 'base64_convert.dart';

class ProductAxaVertical extends StatelessWidget {
  final GetProdukAxa getProductAxa = Get.put(GetProdukAxa());


  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (getProductAxa.isLoading.value) {
        return Center(child: CircularProgressIndicator());
      } else {
        return ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: (getProductAxa.getVideoProdukAxa.length / 2).ceil(),
          itemBuilder: (context, index) {
            int startIndex = index * 2;
            int endIndex = startIndex;
            if (endIndex >= getProductAxa.getVideoProdukAxa.length) {
              endIndex = getProductAxa.getVideoProdukAxa.length - 1;
            }
            final key = index;
            return Column(
              children: [
                Container(
                  key: ValueKey(key),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.grey.shade300,
                        width: 1.0,
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: ItemProductAxa(video: getProductAxa.getVideoProdukAxa[startIndex]),
                      ),
                      SizedBox(width: 5),
                     
                    ],
                  ),
                ), // Adjust the spacing as needed
              ],
            );
          },
        );
      }
    });
  }
}

class ItemProductAxa extends StatelessWidget {
  ItemProductAxa({
    Key? key,
    required this.video,
  }) : super(key: key);

  final Video video;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
      },
      child: Expanded(
        child: Container(
          color: Colors.amber,
          margin: EdgeInsets.only(right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Base64ImageWidget(
                  base64String: video.webContentTittleImage,
                ),
              ),
              SizedBox(height: 10),
              Text(
                video.webContentTittle,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              SizedBox(height: 5),
              Text(
                video.webContentDate.toString(),
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
