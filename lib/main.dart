import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:zhenai/pages/login.dart';
import 'package:zhenai/pages/index.dart';
import 'model.dart';
import './redux/reducer.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final Store store = Store<AppState>(
      appStateReducer,
      initialState: AppState.initialState()
    );

    return new MaterialApp(
      title: '珍爱网',
      debugShowCheckedModeBanner: false,
      home: new Login(),
      routes: <String, WidgetBuilder> {
        '/index': (BuildContext context) => Index(),
        '/login': (BuildContext context) => Login()
      }
    );
  }
}
