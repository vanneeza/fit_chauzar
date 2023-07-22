import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../utils/web_view.dart';
import '../home/controllers/search_produk_axa_controller.dart';
import '../../utils/base64_convert.dart';

class ProductAxaScreen extends StatefulWidget {
  const ProductAxaScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProdukAxaScreenState createState() => _ProdukAxaScreenState();
}

class _ProdukAxaScreenState extends State<ProductAxaScreen> {
  final SearchProdukAxa searchProdukAxaController =
      Get.put(SearchProdukAxa());

  bool isTapped = false;
  int tappedIndex = -1;

  void _openWebViewPage(int index) async {
    await Get.to(() => WebViewPage(
          url: searchProdukAxaController.filteredData[index].webContentUrl,
          namaPage: searchProdukAxaController.filteredData[index].webContentTittle,
        ));
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  @override
  void dispose() {
    if (MediaQuery.of(context).orientation == Orientation.landscape) {
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    }
    super.dispose();
  }

  void _onTapDown(int index) {
    setState(() {
      isTapped = true;
      tappedIndex = index;
    });
  }

  void _onTapUp() {
    setState(() {
      isTapped = false;
      tappedIndex = -1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        title: RichText(
          text: const TextSpan(
            text: 'Produk Axa Financial Service',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            margin: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextField(
                  controller: searchProdukAxaController.inputSearch,
                  style: const TextStyle(color: Colors.black),
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
                        searchProdukAxaController.searchText.value =
                            searchProdukAxaController.inputSearch.text;
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Obx(
                    () => searchProdukAxaController.isLoading.value
                        ? const Center(child: CircularProgressIndicator())
                        : SingleChildScrollView(
                            child: Column(
                              children: [
                                for (var index = 0;
                                    index < searchProdukAxaController.filteredData.length;
                                    index += 2)
                                  Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          _openWebViewPage(index);
                                        },
                                        onTapDown: (_) => _onTapDown(index),
                                        onTapUp: (_) => _onTapUp(),
                                        onTapCancel: () => _onTapUp(),
                                        child: AnimatedOpacity(
                                          duration: Duration.zero,
                                          opacity: isTapped && tappedIndex == index
                                              ? 0.2
                                              : 1.0,
                                          child: Container(
                                            width: MediaQuery.of(context).size.width * 0.45,
                                            height: 270,
                                            decoration: const BoxDecoration(
                                              color: Colors.white,
                                              border: Border(
                                                bottom: BorderSide(color: Colors.grey, width: 1),
                                              ),
                                            ),
                                            margin: const EdgeInsets.only(bottom: 10),
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width: 140,
                                                  height: 140,
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(40),
                                                  ),
                                                  child: Base64ImageWidget(
                                                      base64String: searchProdukAxaController
                                                          .filteredData[index]
                                                          .webContentTittleImage),
                                                ),
                                                const SizedBox(height: 10),
                                                Text(
                                                  searchProdukAxaController.filteredData[index].webContentTittle,
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15,
                                                    overflow: TextOverflow.ellipsis,
                                                  ),
                                                ),
                                                const SizedBox(height: 10),
                                                Text(
                                                  searchProdukAxaController.filteredData[index].webContentDate,
                                                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                                                ),
                                                const SizedBox(height: 10),
                                                Text(
                                                  searchProdukAxaController.filteredData[index].webContentDescription.substring(0, searchProdukAxaController.filteredData[index].webContentDescription.length < 40 ? searchProdukAxaController.filteredData[index].webContentDescription.length : 40),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      if (index + 1 < searchProdukAxaController.filteredData.length)
                                        GestureDetector(
                                          onTap: () {
                                            _openWebViewPage(index + 1);
                                          },
                                          onTapDown: (_) => _onTapDown(index + 1),
                                          onTapUp: (_) => _onTapUp(),
                                          onTapCancel: () => _onTapUp(),
                                          child: AnimatedOpacity(
                                            duration: Duration.zero,
                                            opacity: isTapped && tappedIndex == index + 1
                                                ? 0.2
                                                : 1.0,
                                            child: Container(
                                              width: MediaQuery.of(context).size.width * 0.40,
                                              height: 270,
                                              decoration: const BoxDecoration(
                                                color: Colors.white,
                                                border: Border(
                                                  bottom: BorderSide(color: Colors.grey, width: 1),
                                                ),
                                              ),
                                              margin: const EdgeInsets.only(bottom: 10),
                                              padding: const EdgeInsets.all(8.0),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  SizedBox(
                                                    width: 140,
                                                    height: 140,
                                                    child: Base64ImageWidget(
                                                        base64String: searchProdukAxaController
                                                            .filteredData[index + 1]
                                                            .webContentTittleImage),
                                                  ),
                                                  const SizedBox(height: 10),
                                                  Text(
                                                    searchProdukAxaController.filteredData[index + 1].webContentTittle,
                                                    style: const TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 15,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 10),
                                                  Text(
                                                    searchProdukAxaController.filteredData[index + 1].webContentDate,
                                                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                                                  ),
                                                  const SizedBox(height: 10),
                                                  Text(
                                                    searchProdukAxaController.filteredData[index + 1].webContentDescription.substring(0, searchProdukAxaController.filteredData[index + 1].webContentDescription.length < 40 ? searchProdukAxaController.filteredData[index + 1].webContentDescription.length : 40),
                                                  ),
                                                ],
                                              ),
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
      ),
    );
  }
}
