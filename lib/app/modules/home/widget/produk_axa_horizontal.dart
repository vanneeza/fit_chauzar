import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/web_view.dart';
import '../controllers/home_controller.dart';
import '../../../data/models/video.dart';
import '../widget/base64_convert.dart';


class ProductAxaHorizontal extends StatelessWidget {
  final GetProdukAxa getProdukAxa = Get.put(GetProdukAxa()); 

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Obx(
        () => Row(
          children: getProdukAxa.getVideoProdukAxa.map((video) { 
            return ItemProdukAxa(video: video);
          }).toList(),
        ),
      ),
    );
  }
}

class ItemProdukAxa extends StatelessWidget {
  ItemProdukAxa({
    Key? key,
    required this.video,
  }) : super(key: key);

  final Video video;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => WebViewPage(
              url: video.webContentUrl,
              namaPage: video.webContentTittle,
            ));
      },
      child: Container(
        margin: EdgeInsets.only(right: 30),
        width: Get.width * 0.36,
        height: 200,
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: Get.width,
                height: 130,
                child: Base64ImageWidget(
                  base64String: video.webContentTittleImage,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                video.webContentTittle,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                video.webContentDate.toString(),
                style: TextStyle(fontSize: 12, color: Colors.grey[500]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

