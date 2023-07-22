import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../controllers/search_video_mi_controller.dart';
import 'base64_convert.dart';
import '../../../utils/web_view.dart';

class VideoMIVertical extends StatelessWidget {
  final GetVideoMI getVideoMI = Get.put(GetVideoMI());
  final SearchVideoMIController searchVideoMI = Get.put(SearchVideoMIController());
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'InfoSehat',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: false,
        backgroundColor: Colors.white,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        margin: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                hintText: 'Cari Sesuatu...',
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    // controller.searchText.value = controller.inputSearch.text;
                  },
                ),
              ),
            ),
            Expanded(
              child: Obx(
                () => getVideoMI.isLoading.value
                    ? Center(child: CircularProgressIndicator())
                    : SingleChildScrollView(
                        child: Column(
                          children: [
                            for (var index = 0;
                                index < getVideoMI.getVideo.length;
                                index += 2)
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Get.to(() => WebViewPage(
                                            url: 'https://amazon.com',
                                            namaPage: 'amazon'
                                          ));
                                    },
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.45,
                                      height: 270,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border(
                                          bottom: BorderSide(
                                              color: Colors.grey, width: 1),
                                        ),
                                      ),
                                      margin: EdgeInsets.only(bottom: 10),
                                      padding: EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: 140,
                                            height: 140,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(40),
                                              
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                          Container(
                                            child: Text(
                                              "${getVideoMI.getVideo[index].webContentTittle}",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15,
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                          Container(
                                            child: Text(
                                              "${getVideoMI.getVideo[index].webContentDate}",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.grey),
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                          Container(
                                            child: Text(
                                                "${getVideoMI.getVideo[index].webContentDescription!.substring(0, getVideoMI.getVideo[index].webContentDescription!.length < 40 ? getVideoMI.getVideo[index].webContentDescription!.length : 40)}"),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  if (index + 1 <
                                      getVideoMI.getVideo.length)
                                    GestureDetector(
                                      onTap: () {
                                        Get.to(() => WebViewPage(
                                              url: getVideoMI
                                                  .getVideo[index + 1]
                                                  .webContentUrl
                                                  .toString(),
                                              namaPage: getVideoMI
                                                  .getVideo[index + 1]
                                                  .webContentTittle
                                                  .toString(),
                                            ));
                                      },
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.45,
                                        height: 270,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border(
                                            bottom: BorderSide(
                                                color: Colors.grey, width: 1),
                                          ),
                                        ),
                                        margin: EdgeInsets.only(bottom: 10),
                                        padding: EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: 140,
                                              height: 140,
                                              child: Base64ImageWidget(base64String: getVideoMI.getVideo[index + 1].webContentTittleImage),

                                            ),
                                            SizedBox(height: 10),
                                            Container(
                                              child: Text(
                                                "${getVideoMI.getVideo[index + 1].webContentTittle}",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15,
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 10),
                                            Container(
                                              child: Text(
                                                "${getVideoMI.getVideo[index + 1].webContentDate}",
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.grey),
                                              ),
                                            ),
                                            SizedBox(height: 10),
                                            Container(
                                              child: Text(
                                                  "${getVideoMI.getVideo[index + 1].webContentDescription!.substring(0, getVideoMI.getVideo[index + 1].webContentDescription!.length < 40 ? getVideoMI.getVideo[index + 1].webContentDescription!.length : 40)}"),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                          ],
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}