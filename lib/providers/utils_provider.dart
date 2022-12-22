import 'package:flutter/material.dart';

class UtilsProvider extends ChangeNotifier{

  bool? _isLoading = false;
  bool? _isDownloading = false;

  bool? get isLoading => _isLoading;
  bool? get isDownloading => _isDownloading;

  void setLoader(bool? isLoading){
    _isLoading = isLoading;
    notifyListeners();
  }
  void setDownloader(bool? isDownloading){
    _isDownloading = isDownloading;
    notifyListeners();
  }

}