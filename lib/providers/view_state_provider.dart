import 'package:flutter/material.dart';
import 'package:simple_flutter_app/enums/view_state.dart';

class ViewStateProvider with ChangeNotifier {
  ViewState _viewState = ViewState.Idle;
  String _errorMessage;

  set viewState(ViewState viewState) {
    _viewState = viewState;
    notifyListeners();
  }

  get viewState => _viewState;

  set errorMessage(String errorMessage) {
    _errorMessage = errorMessage;
    notifyListeners();
  }

  get errorMessage => _errorMessage;
}
