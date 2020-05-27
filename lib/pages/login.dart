import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:io' show Platform;
import 'package:device_info/device_info.dart';
import 'package:zhenai/utils/http.dart';
import 'package:zhenai/route.dart';

class DeviceInfo {
  static Future<String> _getId() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      IosDeviceInfo iosDeviceInfo = await deviceInfo.iosInfo;
      return iosDeviceInfo.identifierForVendor; // unique ID on iOS
    } else {
      AndroidDeviceInfo androidDeviceInfo = await deviceInfo.androidInfo;
      return androidDeviceInfo.androidId; // unique ID on Android
    }
  }
}

class LoginForm extends StatefulWidget {
  @override
  _LoginForm createState() => new _LoginForm();
}


class _LoginForm extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  String phone = '2000046632'; // 手机号
  String pwd = '735595'; // 密码

  Future getDeviceId() async {
    var id = await (DeviceInfo._getId());
    print(id);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    getDeviceId();
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            width: ScreenUtil().setWidth(600),
            child: TextFormField(
              autofocus: true,
              initialValue: phone,
              decoration: InputDecoration(
                prefixIcon: Image.asset('lib/images/phone.png', width: ScreenUtil().setWidth(10), height: ScreenUtil().setWidth(10)),
                hintText: '请输入手机号',
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return '请输入正确手机号！';
                }
                return null;
              },
              onChanged: (String value) {
                setState((){
                  phone = value;
                });
              },
            ),
          ),
          Container(
            width: ScreenUtil().setWidth(600),
            margin: EdgeInsets.fromLTRB(0, ScreenUtil().setWidth(40), 0, 0),
            child: TextFormField(
              initialValue: pwd,
              decoration: InputDecoration(
                prefixIcon: Image.asset('lib/images/pwd.png', width: ScreenUtil().setWidth(10), height: ScreenUtil().setWidth(10)),
                hintText: '请输入密码',
                border: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: new Color.fromRGBO(0, 0, 0, 0.1),
                    )
                ),
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return '请输入密码';
                }
                return null;
              },
              onChanged: (String value) {
                setState((){
                  pwd = value;
                });
              },
            ),
          ),
          Container(
            width: ScreenUtil().setWidth(440),
            height: ScreenUtil().setWidth(80),
            margin: EdgeInsets.fromLTRB(0, 100, 0, 0),
            color: new Color.fromRGBO(128, 112, 241, 1),
            child: RaisedButton(
              color: new Color.fromRGBO(128, 112, 241, 1),
              onPressed: () async {
                if (_formKey.currentState.validate()) {
                  print(phone);
                  print(pwd);
                  var res = await Fetch.post(url: '/login/userLogin.do', data: {
                    'account': phone,
                    'password': pwd,
                    'captchaType': 1,
                  });
                  if (!res['isError']) {
                    Navigator.of(context).push(CreateRoute.open('index'));
                  }
                }
              },
              child: Text(
                  '登录',
                  style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      fontSize: ScreenUtil().setSp(30)
                  )
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LoginBody extends StatefulWidget {
  @override
  _LoginBody createState() => new _LoginBody();
}

class _LoginBody extends State<LoginBody> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: false);
    return Container(
      width: ScreenUtil().setWidth(750),
      color: Color.fromRGBO(255, 255, 255, 1),
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(0, 37, 0, 0),
            child: Column(
              children: <Widget>[
                Text('绑定你的珍爱网账号', style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontSize: ScreenUtil().setSp(30)
                )),
                Text('便于红娘老师为你提供专属服务', style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontSize: ScreenUtil().setSp(30)
                )),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
            child: LoginForm(),
          )
        ],
      ),
    );
  }
}


class Login extends StatelessWidget {
  final topBar = new AppBar(
      backgroundColor: new Color.fromRGBO(255, 255, 255, 1) ,
      centerTitle: true,
      title: Text(
          '登录',
          style: TextStyle(color: new Color.fromRGBO(0, 0, 0, 1) )
      ),
      leading: Builder(
        builder: (BuildContext context) {
          return GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset('lib/images/back.png',
                    width: ScreenUtil().setWidth(50),
                    height: ScreenUtil().setWidth(50),
                  ),
                ],
              )
          );
        },
      ),
  );



  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: topBar,
        body: LoginBody(),
    );
  }
}
