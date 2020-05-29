import 'package:redux/redux.dart';
import '../model.dart';
import './reducer.dart';

class ZhenaiStore {
  static ZhenaiStore _instance;

  Store _storeInstance;

  get store => _storeInstance;

  ZhenaiStore._();

  factory ZhenaiStore() {
    return _instance;
  }

  static init() {
    if (_instance == null) {
      _instance = ZhenaiStore._();
      _instance._storeInstance = Store<AppState>(
          appStateReducer,
          initialState: AppState.initialState()
      );
    }
  }
}

