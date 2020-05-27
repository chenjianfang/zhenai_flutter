import 'package:flutter/material.dart';
import 'package:zhenai/app_body.dart';
import 'package:zhenai/components/footer_nav.dart';


class AppHome extends StatelessWidget {
  final topBar = new AppBar(
    backgroundColor: new Color.fromRGBO(255, 255, 255, 1) ,
    centerTitle: false,
    title: Text(
      '推荐',
      style: TextStyle(color: new Color.fromRGBO(0, 0, 0, 1) )
    )
  );



  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: topBar,
      body: new AppBody(),
      bottomNavigationBar: new FooterNav()
    );
  }
}
