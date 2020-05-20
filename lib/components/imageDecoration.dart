import 'package:flutter/material.dart';

class ImageDecoration extends StatefulWidget {
  final String imageUrl; 
  ImageDecoration({@required this.imageUrl});

  @override
  _ImageDecorationState createState() => _ImageDecorationState();
}

class _ImageDecorationState extends State<ImageDecoration> {
  @override
  Widget build(BuildContext context) {
    return Image.asset(widget.imageUrl);
    
    // Container(
    //   decoration: BoxDecoration(
    //     image: DecorationImage(image: AssetImage(widget.imageUrl))
    //   ),
    // );
  }
}