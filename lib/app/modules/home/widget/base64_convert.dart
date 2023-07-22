import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';

class Base64ImageWidget extends StatelessWidget {
  final String base64String;

  Base64ImageWidget({required this.base64String});

  @override
  Widget build(BuildContext context) {
    Uint8List bytes = base64Decode(base64String);

    return Image.memory(
      bytes,
      fit: BoxFit.cover,
    );
  }
}