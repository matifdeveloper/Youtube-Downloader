import 'package:flutter/material.dart';
import 'package:yt_downloader/screens/home/home_screen.dart';
import 'package:yt_downloader/screens/user_guide/user_guide_screen.dart';

Map<String, Widget Function(BuildContext)> routes = {
  '/home': (_) => HomeScreen.id,
  '/userGuideScreen': (_) => UserGuideScreen.id,
};