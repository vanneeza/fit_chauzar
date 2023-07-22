import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../utils/web_view.dart';
import '../home/controllers/search_video_mi_controller.dart';
import '../home/widget/base64_convert.dart';

class VideoMIScreen extends StatefulWidget {
  @override
  _VideoMIScreenState createState() => _VideoMIScreenState();
}

class _VideoMIScreenState extends State<VideoMIScreen> {
  final SearchVideoMIController searchVideoMIController =
      Get.put(SearchVideoMIController());

  void _openWebViewPage(int url) async {
    await Get.to(() => WebViewPage(
          url: searchVideoMIController.filteredData[url].webContentUrl,
          namaPage: searchVideoMIController.filteredData[url].webContentTittle,
        ));
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  @override
  void dispose() {
    // Cek apakah saat ini orientasi layar adalah landscape
    if (MediaQuery.of(context).orientation == Orientation.landscape) {
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        title: RichText(
          text: TextSpan(
            text: 'Video MI',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          margin: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                controller: searchVideoMIController.inputSearch,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[100],
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  hintText: 'Cari Sesuatu',
                  hintStyle: TextStyle(color: Colors.grey[500]),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.search, color: Colors.grey[800]),
                    onPressed: () {
                      searchVideoMIController.searchText.value =
                          searchVideoMIController.inputSearch.text;
                      print('Icon DI press');
                    },
                  ),
                ),
              ),
              Expanded(
                child: Obx(
                  () => searchVideoMIController.isLoading.value
                      ? Center(child: CircularProgressIndicator())
                      : SingleChildScrollView(
                          child: Column(
                            children: [
                              for (var index = 0;
                                  index <
                                      searchVideoMIController
                                          .filteredData.length;
                                  index += 2)
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                       _openWebViewPage(index);
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
                                              child: Base64ImageWidget(
                                                  base64String:
                                                      searchVideoMIController
                                                          .filteredData[index]
                                                          .webContentTittleImage),
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
                                                "${searchVideoMIController.filteredData[index].webContentTittle}",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 10),
                                            Container(
                                              child: Text(
                                                "${searchVideoMIController.filteredData[index].webContentDate}",
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.grey),
                                              ),
                                            ),
                                            SizedBox(height: 10),
                                            Container(
                                              child: Text(
                                                  "${searchVideoMIController.filteredData[index].webContentDescription!.substring(0, searchVideoMIController.filteredData[index].webContentDescription!.length < 40 ? searchVideoMIController.filteredData[index].webContentDescription!.length : 40)}"),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    if (index + 1 <
                                        searchVideoMIController
                                            .filteredData.length)
                                      GestureDetector(
                                        onTap: () {
                                          _openWebViewPage(index + 1);
                                        },
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.40,
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
                                                child: Base64ImageWidget(
                                                    base64String:
                                                        searchVideoMIController
                                                            .filteredData[
                                                                index + 1]
                                                            .webContentTittleImage),
                                              ),
                                              SizedBox(height: 10),
                                              Container(
                                                child: Text(
                                                  "${searchVideoMIController.filteredData[index + 1].webContentTittle}",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: 10),
                                              Container(
                                                child: Text(
                                                  "${searchVideoMIController.filteredData[index + 1].webContentDate}",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.grey),
                                                ),
                                              ),
                                              SizedBox(height: 10),
                                              Container(
                                                child: Text(
                                                    "${searchVideoMIController.filteredData[index + 1].webContentDescription!.substring(0, searchVideoMIController.filteredData[index + 1].webContentDescription!.length < 40 ? searchVideoMIController.filteredData[index + 1].webContentDescription!.length : 40)}"),
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
      ),
    );
  }
}
