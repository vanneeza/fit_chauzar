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
  bool isHovering = false;
  void _openWebViewPage() async {
    await Get.to(() => WebViewPage(
          url: widget.video.webContentUrl,
          namaPage: widget.video.webContentTittle,
        ));
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _openWebViewPage();
      },
      onTapDown: (_) {
        setState(() {
          isHovering = true;
        });
      },
      onTapUp: (_) {
        setState(() {
          isHovering = false;
        });
      },
      onTapCancel: () {
        setState(() {
          isHovering = false;
        });
      },
      child: Material(
        color: Colors.white, 
        child: Ink(
          decoration: BoxDecoration(
            color: isHovering ? Colors.white70 : Colors.white,
          ),
          child: AnimatedContainer(
            duration: Duration(milliseconds: 300), // Durasi animasi
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
      ),
    );
  }
}
