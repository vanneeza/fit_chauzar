import 'dart:convert';

// ignore: non_constant_identifier_names
List<Video> VideoFromJson(String str) =>
    List<Video>.from(json.decode(str).map((x) => Video.fromJson(x)));

// ignore: non_constant_identifier_names
String VideoToJson(List<Video> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Video {
  String rowId;
  String webContentTittle;
  String webContentTittleImage;
  String webContentUrl;
  String webContentTittleTpCd;
  String webContentTittleTpNm;
  String webContentDate;
  String webContentDescription;

  Video({
    required this.rowId,
    required this.webContentTittle,
    required this.webContentTittleImage,
    required this.webContentUrl,
    required this.webContentTittleTpCd,
    required this.webContentTittleTpNm,
    required this.webContentDate,
    required this.webContentDescription,
  });

  factory Video.fromJson(Map<String, dynamic> json) => Video(
        rowId: json['rowId'],
        webContentTittle: json['webContentTittle'],
        webContentTittleImage: json['webContentTittleImage'],
        webContentUrl: json['webContentUrl'],
        webContentTittleTpCd: json['webContentTittleTpCd'],
        webContentTittleTpNm: json['webContentTittleTpNm'],
        webContentDate: json['webContentDate'],
        webContentDescription: json['webContentDescription'],
      );

  Map<String, dynamic> toJson() => {
        "rowId": rowId,
        "webContentTittle": webContentTittle,
        "webContentTittleImage": webContentTittleImage,
        "webContentUrl": webContentUrl,
        "webContentTittleTpCd": webContentTittleTpCd,
        "webContentTittleTpNm": webContentTittleTpNm,
        "webContentDate": webContentDate,
        "webContentDescription": webContentDescription,
      };
}
