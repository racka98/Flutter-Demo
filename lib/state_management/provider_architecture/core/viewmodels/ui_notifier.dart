import 'package:flutter/foundation.dart';
import 'package:flutter_demo/state_management/provider_architecture/core/enums/view_state.dart';

class UiNotifier extends ChangeNotifier {
  ViewState _state = ViewState.Idle;

  ViewState get state => _state;

  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }
}
