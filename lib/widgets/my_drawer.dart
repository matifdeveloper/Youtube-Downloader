import 'package:flutter/material.dart';
import 'package:yt_downloader/screens/user_guide/user_guide_screen.dart';
import 'package:yt_downloader/utils/utils.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            width: double.infinity,
            height: 100.0,
            alignment: Alignment.bottomLeft,
            color: Colors.redAccent,
            child: Text(
              'YT DOWNLOADER',
              style: Styles.titleStyle.copyWith(
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          ListView(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            primary: false,
            children: [
              ListTile(
                title: const Text('Home'),
                leading: const Icon(Icons.home_outlined),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Downloads'),
                leading: const Icon(Icons.download_outlined),
                onTap: () {
                  Constants.showToast(msg: 'Coming soon');
                },
              ),
              ListTile(
                title: const Text('Share'),
                leading: const Icon(Icons.share_outlined),
                onTap: () {
                  Constants.share(
                      'https://play.google.com/store/apps/details?id=com.noorisofttech.yt_downloader');
                },
              ),
              ListTile(
                title: const Text('Privacy Policy'),
                leading: const Icon(Icons.privacy_tip_outlined),
                onTap: () {
                  UserGuideScreen.path = 'assets/guider/privacy.html';
                  Navigator.pushNamed(context, '/userGuideScreen');
                },
              ),
              ListTile(
                title: const Text('Terms & conditions'),
                leading: const Icon(Icons.file_open_outlined),
                onTap: () {
                  UserGuideScreen.path = 'assets/guider/term_conditions.html';
                  Navigator.pushNamed(context, '/userGuideScreen');
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}