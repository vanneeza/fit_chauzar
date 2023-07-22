import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/web_view.dart';
import '../home/controllers/search_produk_axa_controller.dart';
import '../home/widget/base64_convert.dart';

class ProductAxaScreen extends StatelessWidget {
  final SearchProdukAxa searchProdukAxa = Get.put(SearchProdukAxa());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        title: RichText(
          text: TextSpan(
            text: 'Produk Axa Financial Service',
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
                controller: searchProdukAxa.inputSearch,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  filled: true,
                  fillColor:
                      Colors.grey[100], 
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none, 
                    borderRadius: BorderRadius.circular(30),
                  ),
                  hintText: 'Cari Sesuatu',
                  hintStyle: TextStyle(
                      color:
                          Colors.grey[500]), 
                  suffixIcon: IconButton(
                    icon: Icon(Icons.search,
                        color: Colors.grey[800]),
                    onPressed: () {
                      searchProdukAxa.searchText.value =
                          searchProdukAxa.inputSearch.text;
                      print('Icon DI press');
                    },
                  ),
                ),
              ),
              Expanded(
                child: Obx(
                  () => searchProdukAxa.isLoading.value
                      ? Center(child: CircularProgressIndicator())
                      : SingleChildScrollView(
                          child: Column(
                            children: [
                              for (var index = 0;
                                  index <
                                      searchProdukAxa
                                          .filteredData.length;
                                  index += 2)
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Get.to(() => WebViewPage(
                                            url: searchProdukAxa
                                                .filteredData[index]
                                                .webContentUrl,
                                            namaPage: searchProdukAxa
                                                .filteredData[index]
                                                .webContentTittle));
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
                                                      searchProdukAxa
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
                                                "${searchProdukAxa.filteredData[index].webContentTittle}",
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
                                                "${searchProdukAxa.filteredData[index].webContentDate}",
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.grey),
                                              ),
                                            ),
                                            SizedBox(height: 10),
                                            Container(
                                              child: Text(
                                                  "${searchProdukAxa.filteredData[index].webContentDescription!.substring(0, searchProdukAxa.filteredData[index].webContentDescription!.length < 40 ? searchProdukAxa.filteredData[index].webContentDescription!.length : 40)}"),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    if (index + 1 <
                                        searchProdukAxa
                                            .filteredData.length)
                                      GestureDetector(
                                        onTap: () {
                                          Get.to(() => WebViewPage(
                                                url: searchProdukAxa
                                                    .filteredData[index + 1]
                                                    .webContentUrl
                                                    .toString(),
                                                namaPage:
                                                    searchProdukAxa
                                                        .filteredData[index + 1]
                                                        .webContentTittle
                                                        .toString(),
                                              ));
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
                                                        searchProdukAxa
                                                            .filteredData[
                                                                index + 1]
                                                            .webContentTittleImage),
                                              ),
                                              SizedBox(height: 10),
                                              Container(
                                                child: Text(
                                                  "${searchProdukAxa.filteredData[index + 1].webContentTittle}",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: 10),
                                              Container(
                                                child: Text(
                                                  "${searchProdukAxa.filteredData[index + 1].webContentDate}",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.grey),
                                                ),
                                              ),
                                              SizedBox(height: 10),
                                              Container(
                                                child: Text(
                                                    "${searchProdukAxa.filteredData[index + 1].webContentDescription!.substring(0, searchProdukAxa.filteredData[index + 1].webContentDescription!.length < 40 ? searchProdukAxa.filteredData[index + 1].webContentDescription!.length : 40)}"),
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
