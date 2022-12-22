import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:yt_downloader/providers/utils_provider.dart';
import 'package:yt_downloader/services/ad_service.dart';
import 'package:yt_downloader/services/downloader_helper.dart';
import 'package:yt_downloader/utils/utils.dart';
import 'package:yt_downloader/widgets/utils.dart';

class HomeScreen extends StatefulWidget {
  static const HomeScreen id = HomeScreen();

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with WidgetsBindingObserver {
  final _downloaderHelper = DownloaderHelper();
  final _adService = AdService();

  final TextEditingController _linkController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _adService.loadBannerAd(context, AdSize.banner);
    _adService.createInterstitialAd();
  }

  @override
  Widget build(BuildContext context) {
    final utilsProvider = Provider.of<UtilsProvider>(context);
    return Scaffold(
      drawer: const MyDrawer(),
      appBar: AppBar(
        title: const Text('Youtube Downloader'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Constants.share('https://play.google.com/store/apps/details?id=com.noorisofttech.yt_downloader');
            },
            icon: const Icon(Icons.share_outlined),
          ),
        ],
      ),
      body: ModalProgressHUD(
        inAsyncCall: utilsProvider.isLoading!,
        progressIndicator: const CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(
                height: 20.0,
              ),
              Image.asset(
                'assets/images/youtube_logo.png',
                width: MediaQuery.of(context).size.width * 0.2,
              ),
              const SizedBox(
                height: 30.0,
              ),
              TextField(
                controller: _linkController,
                decoration: const InputDecoration(
                  hintText: 'Paste youtube video link here',
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        _linkController.clear();
                        Clipboard.getData(Clipboard.kTextPlain).then((value){
                          _linkController.text = value!.text!;
                        });
                        _adService.showInterstitialAd();
                      },
                      child: const Text('Paste Link'),
                    ),
                  ),
                  const SizedBox(
                    width: 15.0,
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        if (_linkController.text.isEmpty) {
                          Constants.showToast(msg: 'Please provide link');
                          return;
                        }
                        if (!_linkController.text.contains("youtu")) {
                          Constants.showToast(msg: 'Enter a YouTube URL !');
                          return;
                        }
                        _validate(context);
                      },
                      child: const Text('Download'),
                    ),
                  ),
                  const SizedBox(
                    width: 15.0,
                  ),
                ],
              ),
            ],
          ),
        ),
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

  void _validate(BuildContext context) async {
    Constants.showToast(msg: 'Please wait...');
    final utilsProvider = Provider.of<UtilsProvider>(context, listen: false);
    final scaffoldMessenger = ScaffoldMessenger.of(context);

    utilsProvider.setLoader(true);
    var data = await _downloaderHelper.getVideoInfo(
      Uri.parse(_linkController.text),
    );
    utilsProvider.setLoader(false);
    showModalBottomSheet(
      context: context,
      builder: (_) => MyBottomSheet(
        imageUrl: data['image'].toString(),
        title: data['title'],
        author: data["author"],
        duration: data['duration'].toString(),
        mp3Size: data['mp3'],
        mp4Size: data['mp4'],
        mp3Method: () async {
          utilsProvider.setDownloader(true);
          _adService.showInterstitialAd();
          scaffoldMessenger.showSnackBar(
            SnackBar(
              behavior: SnackBarBehavior.floating,
              duration: const Duration(seconds: 2),
              content: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(
                    Icons.download,
                    color: Colors.white,
                    size: 30,
                  ),
                  Text('  Audio Started Downloading')
                ],
              ),
            ),
          );
          await _downloaderHelper.downloadMp3(data['id'], data['title']);
          utilsProvider.setDownloader(false);
          scaffoldMessenger.showSnackBar(
            SnackBar(
              behavior: SnackBarBehavior.floating,
              duration: const Duration(seconds: 2),
              content: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(
                    Icons.download_done,
                    color: Colors.green,
                    size: 30,
                  ),
                  Text('  Audio Downloaded')
                ],
              ),
            ),
          );
        },
        mp4Method: () async {
          utilsProvider.setDownloader(true);
          _adService.showInterstitialAd();
          scaffoldMessenger.showSnackBar(
            SnackBar(
              behavior: SnackBarBehavior.floating,
              duration: const Duration(seconds: 2),
              content: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(
                    Icons.download,
                    color: Colors.white,
                    size: 30,
                  ),
                  Text('Video Started Downloading')
                ],
              ),
            ),
          );
          await _downloaderHelper.downloadMp4(data['id'], data['title']);
          utilsProvider.setDownloader(false);
          scaffoldMessenger.showSnackBar(
            SnackBar(
              behavior: SnackBarBehavior.floating,
              duration: const Duration(seconds: 2),
              content: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(
                    Icons.download_done,
                    color: Colors.green,
                    size: 30,
                  ),
                  Text('  Video Downloaded')
                ],
              ),
            ),
          );
        },
        isDownloading: utilsProvider.isDownloading,
      ),
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if(state == AppLifecycleState.resumed){
      log('app resume');
      _adService.showInterstitialAd();
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

}
