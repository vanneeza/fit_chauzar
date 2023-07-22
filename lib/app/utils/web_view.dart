import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatelessWidget {
  final String url;
  final String namaPage;

  WebViewPage({required this.url, required this.namaPage});

  @override
  Widget build(BuildContext context) {
    print(url);
    print(namaPage);

    String extension = url.split('.').last.toLowerCase();
    bool isVideoExtension =
        extension == 'mp4' || extension == 'avi' || extension == 'mov';

    List<DeviceOrientation> preferredOrientations = isVideoExtension
        ? [DeviceOrientation.landscapeLeft]
        : [DeviceOrientation.portraitUp];

    SystemChrome.setPreferredOrientations(preferredOrientations);

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.blueAccent),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          namaPage,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: WebView(
              initialUrl: url,
              javascriptMode: JavascriptMode.unrestricted,
            ),
          ),
        ],
      ),
    );
  }
}
