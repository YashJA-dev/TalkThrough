import 'package:flutter/material.dart';

class IntroPageData {
  String tile;
  String body;
  Image image;

  IntroPageData({required this.tile, required this.body, required this.image});

  get getTile => this.tile;

  get getBody => this.body;

  get getImage => this.image;
}
