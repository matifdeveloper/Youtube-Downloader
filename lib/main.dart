import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'package:yt_downloader/providers/ad_provider.dart';
import 'package:yt_downloader/providers/utils_provider.dart';
import 'package:yt_downloader/services/notification_service.dart';
import 'package:yt_downloader/utils/utils.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  LocalNotificationService.initialize();
  MobileAds.instance.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UtilsProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => AdProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Youtube Downloader',
        theme: Styles.theme,
        initialRoute: '/home',
        routes: routes,
      ),
    );
  }
}