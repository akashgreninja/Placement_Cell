
// import 'dart:html';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ImageCarousal extends StatefulWidget {
  @override
  _ImageCarousalState createState() => _ImageCarousalState();
}

class _ImageCarousalState extends State<ImageCarousal> {
  final List<String> images = [
    'Awards.jpg',
    'Run_for_hunger(3).jpg',
    'Run_for_hunger(2).jpeg',
    'Canopy.jpg',
    'Treaking.jpg',


  ];
  final List<String> events = [
    "Run_for_hunger",

    "Canopy",
    "Treaking",
    "Book",
    "awards"
  ];
  List _isHovering = [false,false,false, false, false];
  List _isSelected = [false,false,false, false, false];

  int _current = 0;
  final CarouselController _carouselController = CarouselController();
  List<Widget> generateImageTiles(screenSize){
    return images.map((e) => ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: Image.asset(e,
      fit: BoxFit.cover),
    )).toList();
  }
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var imageSliders = generateImageTiles(screenSize);

    return CarouselSlider(
      items: imageSliders,
      options: CarouselOptions(
          enlargeCenterPage: true,
          aspectRatio: 18 / 8,
          autoPlay: true,
          onPageChanged: (index, reason) {
            setState(() {
              _current = index;
              for (int i = 0; i < imageSliders.length; i++) {
                if (i == index) {
                  _isSelected[i] = true;
                } else {
                  _isSelected[i] = false;
                }
              }
            });
          }),
      carouselController: _carouselController,
    );
  }
}
