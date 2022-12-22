import 'package:fluttertoast/fluttertoast.dart';
import 'package:share_plus/share_plus.dart';

class Constants{

  //static const String APP_ID = 'ca-app-pub-5818564663446600~3801225236';
  static const String BANNER_ID = 'ca-app-pub-5818564663446600/7902716800';
  static const String INTERSTITIAL_ID = 'ca-app-pub-5818564663446600/6589635134';

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