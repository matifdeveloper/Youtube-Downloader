import 'package:flutter/material.dart';

class AdProvider extends ChangeNotifier{

  bool? _isBannerAdReady = false;

  bool? get isBannerAdReady => _isBannerAdReady;

  void bannerAdReady(bool? isBannerAdReady){
    _isBannerAdReady = isBannerAdReady;
    notifyListeners();
  }

  void clearBannerAd(){
    _isBannerAdReady = false;
    notifyListeners();
  }

}