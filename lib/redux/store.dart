import 'package:redux/redux.dart';
import '../model.dart';
import './reducer.dart';

class ZhenaiStore {
  static ZhenaiStore _instance;

  Store storeInstance;

  get store => storeInstance;

  ZhenaiStore._();

  factory ZhenaiStore() {
    return _instance;
  }

  static init() {
    if (_instance == null) {
      print('ZhenaiStore: init');
      _instance = ZhenaiStore._();
      _instance.storeInstance = Store<AppState>(
          appStateReducer,
          initialState: AppState.initialState()
      );
    }
  }
}

