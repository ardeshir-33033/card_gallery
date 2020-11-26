import 'package:flutter/material.dart';
class Gallery{
  String title ;
  String subtitle;
  IconData icon;
  String picUrl;
  String description;
  ButtonBar buttonBar;

  Gallery({
    this.title,
    this.subtitle,
    this.icon,
    this.picUrl,
    this.buttonBar,
    this.description,
});
}