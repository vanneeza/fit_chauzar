import 'package:fit_chauzar/app/modules/home/widget/video_mi_horizontal.dart';
import 'package:fit_chauzar/app/modules/screens/product_axa_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../../screens/video_mi_screen.dart';
import '../widget/produk_axa_horizontal.dart';

class HomeView extends GetView<HomeController> {
  final GetVideoMI VideoMIController = Get.put(GetVideoMI());
  final GetProdukAxa ProductAxaController = Get.put(GetProdukAxa());

  HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xfefeff),
        title: Text('Ini App Bar', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        color: Color(0xfefeff),
        child: Column(
          children: [
            Container(
              height: 260,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Video MI",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(() => VideoMIScreen());
                          },
                          child: const Text(
                            "Lihat Semua",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.blueAccent,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: VideoMIHorizontal(),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              color: Colors.white,
              height: 260,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Produk Axa Financial Service",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(ProductAxaScreen());
                          },
                          child: const Text(
                            "Lihat Semua",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.blueAccent,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Align(
                      alignment: Alignment
                          .centerLeft, 
                      child: ProductAxaHorizontal(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
