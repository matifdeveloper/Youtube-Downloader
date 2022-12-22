import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:yt_downloader/services/ad_service.dart';

class UserGuideScreen extends StatefulWidget {
  static String path = '';
  static const UserGuideScreen id = UserGuideScreen();
  const UserGuideScreen({Key? key}) : super(key: key);
  @override
  State<UserGuideScreen> createState() => _UserGuideScreenState();
}

class _UserGuideScreenState extends State<UserGuideScreen> {
  final AdService _adService = AdService();
  WebViewController controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(const Color(0x00000000))
    ..setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {
          // Update loading bar.
        },
        onPageStarted: (String url) {},
        onPageFinished: (String url) {},
        onWebResourceError: (WebResourceError error) {},
        onNavigationRequest: (NavigationRequest request) {
          if (request.url.startsWith('')) {
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      ),
    )
    ..loadFlutterAsset(UserGuideScreen.path);

  @override
  void initState() {
    super.initState();
    _adService.loadBannerAd(context, AdSize.banner);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('YT Downloader'),
      ),
      body: WebViewWidget(
        controller: controller,
      ),
      bottomNavigationBar: Container(
        alignment: Alignment.center,
        width: _adService.bannerAd.size.width.toDouble(),
        height: _adService.bannerAd.size.height.toDouble(),
        child: AdWidget(
          ad: _adService.bannerAd,
        ),
      ),
    );
  }
}