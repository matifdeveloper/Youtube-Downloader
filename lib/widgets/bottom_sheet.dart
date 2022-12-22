import 'package:flutter/material.dart';
import 'package:yt_downloader/utils/utils.dart';

class MyBottomSheet extends StatelessWidget {
  const MyBottomSheet({Key? key, required this.imageUrl,
    required this.title,
    required this.author,
    required this.mp3Method,
    required this.mp4Method,
    required this.isDownloading,
    required this.mp3Size,
    required this.mp4Size,
    required this.duration}) : super(key: key);

  final String imageUrl;
  final String title;
  final String author;
  final String duration;
  final String mp3Size;
  final String mp4Size;
  final bool? isDownloading;
  final void Function()? mp3Method;
  final void Function()? mp4Method;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 10, bottom: 10),
              height: size.height * 0.2,
              decoration:
              BoxDecoration(borderRadius: BorderRadius.circular(25)),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
                errorBuilder: (context, error, stackTrace) =>
                const Placeholder(),
              ),
            ),
            Text(
              title,
              style: Styles.subHeadingStyle,
            ),
            Text(
              author,
              style: Styles.titleStyle.copyWith(color: Colors.blue),
            ),
            Text(
              duration,
              style: Styles.bodyStyle,
            ),

            const SizedBox(height: 10),
            TextButton(
                onPressed: mp3Method,
                child: Text('Download MP3 ($mp3Size MB)')),
            ElevatedButton(
                onPressed: mp4Method,
                child: Text('Download MP4 ($mp4Size MB)')),
          ],
        ),
      ),
    );
  }
}
