import 'package:fluttertoast/fluttertoast.dart';
import 'package:share_plus/share_plus.dart';

class Constants{

  //static const String APP_ID = 'ca-app-pub-5818564663446600~3801225236';
  static const String BANNER_ID = 'ca-app-pub-3940256099942544/6300978111';
  static const String INTERSTITIAL_ID = 'ca-app-pub-3940256099942544/1033173712';

  static void showToast({String? msg}){
    Fluttertoast.showToast(
        msg: msg!,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        fontSize: 16.0
    );
  }

  static void share(String? text){
    Share.share(text!);
  }
}