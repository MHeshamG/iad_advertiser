import 'package:flutter/material.dart';
import 'package:iad_advertiser/core/view_models/ViewState.dart';

class BaseViewModel extends ChangeNotifier{
  ViewState _state = ViewState.IDLE;
  ViewState get state => _state;

  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }
}