import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zhenai/components/footer_nav.dart';
import 'package:zhenai/utils/http.dart';
import 'package:zhenai/route.dart';
import 'package:zhenai/components/index_gray_btn.dart';

class IndexBody extends StatefulWidget {
  @override
  _IndexBody createState() => new _IndexBody();
}

class _IndexBody extends State<IndexBody> {
  // 用户资料
  Map<String, dynamic> userInfo = {};

  // 用户动态
  Map<String, dynamic> moments = {};

  static String objectID = '75732003';

  @override
  void initState() {
    super.initState();
    getObjectInfo();
    getMoments();
  }

  // 获取用户信息
  getObjectInfo() async {
    var res = await Fetch.post(url: '/profile/getObjectProfile.do', data: {
      'objectID': objectID
    });
    if (res['isError'] && res['errorCode'] == '-00004') {
      Navigator.of(context).push(CreateRoute.open('login'));
    } else {
      setState(() {
        userInfo = res['data'];
      });
    }
  }

  getMoments() async {
    var res = await Fetch.get(url: '/live/liveEnterance.do', data: {
      'page': 1,
      'pageSize': 15
    });
    if (res['isError'] && res['errorCode'] == '-00004') {
      Navigator.of(context).push(CreateRoute.open('login'));
    } else {
      setState(() {
        moments = res['data'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: false);
    return userInfo['nickname'] != null ? Container(
      color: Color.fromRGBO(255, 255, 255, 1),
      child: new ListView(
        children: <Widget>[
          Container(
            width: ScreenUtil().setWidth(750),
            height: ScreenUtil().setWidth(750),
            color: Color.fromRGBO(255, 255, 255, 1),
            child: Stack(
              overflow: Overflow.visible,
              children: <Widget>[
                Container(
                  height: ScreenUtil().setWidth(750),
                  width: ScreenUtil().setWidth(750),
                  child: new Image(
                    image: NetworkImage(userInfo['avatarURL']),
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                    bottom: ScreenUtil().setWidth(0),
                    child: ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(27.0),
                            topRight: Radius.circular(27.0)
                        ),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          color: Color.fromRGBO(255, 255, 255, 1),
                          width: ScreenUtil().setWidth(750),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(30), ScreenUtil().setWidth(48), 0, 0),
                            child: Text(
                                userInfo['nickname'],
                                style: TextStyle(
                                    color: Color.fromRGBO(0, 0, 0, 1),
                                    fontSize: ScreenUtil().setSp(42)
                                )
                            ),
                          ),
                        )
                    )
                )
              ],
            ),
          ),
          Container(
            color: Color.fromRGBO(255, 255, 255, 1),
            child: Container(
              padding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(30), ScreenUtil().setWidth(20), 0, 0),
              child: Row(
                children: <Widget>[
                  Text(
                    userInfo['workCityString'],
                    style: TextStyle(color: Color.fromRGBO(102, 105, 120, 1)),
                  ),
                  Container(
                    margin: const EdgeInsets.all(5.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      child: Container(
                        color: Color.fromRGBO(102, 105, 120, 1),
                        width: 4.0,
                        height: 4.0,
                      ),
                    ),
                  ),
                  Text(
                    '${userInfo['age'].toString()}岁',
                    style: TextStyle(color: Color.fromRGBO(102, 105, 120, 1)),
                  ),
                  Container(
                    margin: const EdgeInsets.all(5.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      child: Container(
                        color: Color.fromRGBO(102, 105, 120, 1),
                        width: 4.0,
                        height: 4.0,
                      ),
                    ),
                  ),
                  Text(
                    userInfo['educationString'],
                    style: TextStyle(color: Color.fromRGBO(102, 105, 120, 1)),
                  ),
                  Container(
                    margin: const EdgeInsets.all(5.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      child: Container(
                        color: Color.fromRGBO(102, 105, 120, 1),
                        width: 4.0,
                        height: 4.0,
                      ),
                    ),
                  ),
                  Text(
                    userInfo['heightString'],
                    style: TextStyle(color: Color.fromRGBO(102, 105, 120, 1)),
                  ),
                ],
              ),
            ),
          ),
          Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(ScreenUtil().setWidth(0), ScreenUtil().setWidth(20), 0, 0),
                padding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(36), ScreenUtil().setWidth(40), ScreenUtil().setWidth(12), ScreenUtil().setWidth(24)),
                width: ScreenUtil().setWidth(690),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('lib/images/index/soliloquybg.png'),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Text(
                    userInfo['introduceContent']
                ),
              ),
              Positioned(
                left: ScreenUtil().setWidth(45),
                top: ScreenUtil().setWidth(15),
                child: Image.asset(
                  'lib/images/index/soliloquyicon.png',
                  width: 30,
                  height: 30,
                ),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, ScreenUtil().setWidth(80), 0, 0),
            padding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(30), 0, ScreenUtil().setWidth(30), 0),
            child: new Image(
              image: NetworkImage('https://photo.zastatic.com/images/photo/28047/112184796/23310915290685301_2.png'),
              fit: BoxFit.fill,
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, ScreenUtil().setWidth(80), 0, 0),
            padding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(30), 0, ScreenUtil().setWidth(30), 0),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      Text(
                          '我的动态',
                          style: TextStyle(fontSize: ScreenUtil().setSp(42))
                      ),
                      Text(
                          '（7条）',
                          style: TextStyle(fontSize: ScreenUtil().setSp(30))
                      )
                    ],
                  )
                ),
                Text(
                    '查看所有 >>',
                    style: TextStyle(
                        color: new Color.fromRGBO(139, 118, 249, 1),
                        fontSize: ScreenUtil().setSp(28)
                    )
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, ScreenUtil().setWidth(40), 0, 0),
            padding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(30), 0, ScreenUtil().setWidth(30), 0),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    child: Text(
                        '葬爱，“迩卟懂莪，莪卟怪迩。”多么痛的领悟',
                        style: TextStyle(
                            color: new Color.fromRGBO(66, 71, 92, 1),
                            fontSize: ScreenUtil().setSp(30)
                        )
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, ScreenUtil().setWidth(40), 0, 0),
                    child: Image.asset(
                      'lib/images/index/moment.jpg',
                      width: ScreenUtil().setWidth(640),
                      height: ScreenUtil().setWidth(800),
                    ),
                  )
                ]
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, ScreenUtil().setWidth(80), 0, 0),
            padding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(30), 0, ScreenUtil().setWidth(30), 0),
            child: Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                        '我的资料',
                        style: TextStyle(
                            fontSize: ScreenUtil().setSp(42),
                            fontWeight: FontWeight.bold
                        )
                    ),
                    Text(
                        '（ID：${userInfo['memberID']}）',
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(30),
                        )
                    ),
                  ],
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.fromLTRB(0, ScreenUtil().setWidth(25), 0, 0),
                  child: Text(
                    '详细资料',
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(28),
                        fontWeight: FontWeight.bold
                      )
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, ScreenUtil().setWidth(40), 0, 0),
                  child: indexGrayBtn(userInfo['basicInfo']),
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.fromLTRB(0, ScreenUtil().setWidth(25), 0, 0),
                  child: Text(
                      '择偶条件',
                      style: TextStyle(
                          fontSize: ScreenUtil().setSp(28),
                          fontWeight: FontWeight.bold
                      )
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, ScreenUtil().setWidth(40), 0, 0),
                  child: indexGrayBtn(userInfo['objectInfo']),
                )
              ],
            ),
          )
        ],
      ),
    ) : Container();
  }
}


class Index extends StatelessWidget {
  final topBar = new AppBar(
      backgroundColor: new Color.fromRGBO(255, 255, 255, 1) ,
      centerTitle: false,
      automaticallyImplyLeading: false,
      title: Text(
          '推荐',
          style: TextStyle(color: new Color.fromRGBO(0, 0, 0, 1) )
      )
  );

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: topBar,
        body: IndexBody(),
        bottomNavigationBar: new FooterNav(name: 'index')
    );
  }
}

