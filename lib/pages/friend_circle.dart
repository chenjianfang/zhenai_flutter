import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zhenai/components/footer_nav.dart';


class FriendCircleBody extends StatefulWidget {
  @override
  _FriendCircleBody createState() => new _FriendCircleBody();
}

class _FriendCircleBody extends State<FriendCircleBody> {
  var _photo;
  static const platform = const MethodChannel('zhenai.com/photo');

  Future<Null> _getPhoto() async {
    var photo;
    try {
      photo = await platform.invokeMethod('getPhoto');
    } on PlatformException catch (e) {
      print("Failed to get phone: '${e.message}'.");
    }

    setState(() {
      _photo = photo;
    });
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: false);
    return ListView(
      children: [
        RaisedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) =>CupertinoAlertDialog(
                title: Text('上传图片'),
                content: Text('上传你的头像'),
                actions: [
                  CupertinoDialogAction(
                      child: Text('No'),
                      onPressed: () {
                        Navigator.pop(context, false);
                      },
                  ),
                  CupertinoDialogAction(
                      child: Text('Yes'),
                      onPressed: () {
                        _getPhoto();
                      }
                  ),
                ],
              ),
            );
          },
          child: const Text('上传图片弹框', style: TextStyle(fontSize: 20)),
        )
      ],
    );
  }
}


class FriendCircle extends StatelessWidget {
  final topBar = new AppBar(
      backgroundColor: new Color.fromRGBO(255, 255, 255, 1) ,
      centerTitle: false,
      automaticallyImplyLeading: false,
      title: Text(
          '附近',
          style: TextStyle(color: new Color.fromRGBO(0, 0, 0, 1) )
      )
  );

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: topBar,
        body: FriendCircleBody(),
        bottomNavigationBar: new FooterNav(name: 'friendCircle')
    );
  }
}

