import 'package:flutter/material.dart';
import 'package:zhenai/pages/index.dart';
import 'package:zhenai/pages/login.dart';
import 'package:zhenai/utils/http.dart';


class AppBody extends StatefulWidget {
  @override
  _AppBody createState() => new _AppBody();
}

class _AppBody extends State<AppBody> {
  @override
  void initState() {
    super.initState();
    print('app_body initState');
    var data = {
      'page': 1,
      'pageSize': 1
    };
    Fetch.post(url: 'http://api.zhenai.com/recommend/getRecommendList.do', data: data);
  }

  @override
  Widget build(BuildContext context) {
    var data = {
      'page': 1,
      'pageSize': 1,
      'ua': 'zhenai/6.21.0/18/12.2/iPhone10,1/0f607264fc6318a92b9e13c65db7cd3c/902684/2/www.zhenaidefault.com/1334/750/A608A8BB-C73E-4B63-92F5-8F164E77D804/3/f07bb6f1fdfd652f34e7b4a21d6d20683e0cb9be/test'
    };
    Fetch.get(url: 'http://api.zhenai.com/recommend/getRecommendList.do', data: data);
    return new Login();
  }
}
