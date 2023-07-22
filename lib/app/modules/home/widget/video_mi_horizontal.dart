import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../../../data/models/video.dart';
import '../widget/base64_convert.dart';
import '../../../utils/web_view.dart';

class VideoMIHorizontal extends StatelessWidget {
  final GetVideoMI getVideoMI = Get.put(GetVideoMI());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Obx(
        () => Row(
          children: getVideoMI.getVideo.map((video) {
            return ItemVideoMI(video: video);
          }).toList(),
        ),
      ),
    );
  }
}

class ItemVideoMI extends StatefulWidget {
  ItemVideoMI({
    Key? key,
    required this.video,
  }) : super(key: key);

  final Video video;

  @override
  _ItemVideoMIState createState() => _ItemVideoMIState();
}

class _ItemVideoMIState extends State<ItemVideoMI> {
  bool isTapped = false;

  void _openWebViewPage() async {
    await Get.to(() => WebViewPage(
      url: widget.video.webContentUrl,
      namaPage: widget.video.webContentTittle,
    ));
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  void _onTapDown() {
    setState(() {
      isTapped = true;
    });
  }

  void _onTapUp() {
    setState(() {
      isTapped = false;
    });
  }

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTapDown: (_) => _onTapDown(),
      onTapUp: (_) => _onTapUp(),
      onTapCancel: () => _onTapUp(),
      child: InkWell(
        onTap: _openWebViewPage,
        child: AnimatedOpacity(
          duration: Duration(milliseconds: 0),
          opacity: isTapped ? 0.2 : 1.0,
          child: Container(
            margin: EdgeInsets.only(right: 30),
            width: Get.width * 0.36,
            height: 200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: Get.width,
                  height: 130,
                  child: Base64ImageWidget(
                    base64String: widget.video.webContentTittleImage,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  widget.video.webContentTittle,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  widget.video.webContentDate.toString(),
                  style: TextStyle(fontSize: 12, color: Colors.grey[500]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

