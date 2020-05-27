import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zhenai/utils/http.dart';
import 'package:zhenai/route.dart';
import 'package:zhenai/components/footer_nav.dart';

class FaceLiveBody extends StatefulWidget {
  @override
  _FaceLiveBody createState() => new _FaceLiveBody();
}

class _FaceLiveBody extends State<FaceLiveBody> {
  var liveList = [];

  @override
  void initState() {
    getLiveList();
  }

  getLiveList() async {
    var res = await Fetch.get(url: '/live/liveEnterance.do', data: {
      'page': 1,
      'pageSize': 15
    });
    if (res['isError'] && res['errorCode'] == '-00004') {
      Navigator.of(context).push(CreateRoute.open('login'));
    } else {
//      print(res['data']['liveList'].runtimeType);
      setState(() {
        liveList = [1,2,3,4,5,6];
        this.generatorList();
      });
    }
  }

  List<Widget> generatorList () {
    List<Widget> listBtn = liveList.map((item) {
      return (
          Container(
            padding: EdgeInsets.all(ScreenUtil().setWidth(20)),
            color: new Color.fromRGBO(243, 245, 247, 1),
            child: Column(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  child: Container(
                    padding: EdgeInsets.all(ScreenUtil().setWidth(20)),
                    color: new Color.fromRGBO(255, 255, 255, 1),
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Container(
                              width: ScreenUtil().setWidth(670),
                              height: ScreenUtil().setWidth(368),
                              child: new Image(
                                image: NetworkImage('http://images.zastatic.com/app/live/banner/live_list_banner_i2.jpg'),
                                fit: BoxFit.fill,
                              ),
                            ),
                            Container(
                              width: ScreenUtil().setWidth(100),
                              height: ScreenUtil().setWidth(40),
                              color: new Color.fromRGBO(66, 71, 94, 0.5),
                              alignment: Alignment.center,
                              margin: EdgeInsets.all(ScreenUtil().setWidth(10)),
                              child: Text(
                                  '精彩回放',
                                  style: TextStyle(
                                      color: new Color.fromRGBO(255, 255, 255, 1),
                                      fontSize: ScreenUtil().setSp(24)
                                  )
                              ),
                            )
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(20), ScreenUtil().setWidth(20), ScreenUtil().setWidth(20), 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                  '房间标题',
                                  style: TextStyle(
                                      color: new Color.fromRGBO(66, 71, 92, 1),
                                      fontSize: ScreenUtil().setSp(26)
                                  )
                              ),
                              Text(
                                  '9999人看过',
                                  style: TextStyle(
                                      color: new Color.fromRGBO(136, 146, 150, 1),
                                      fontSize: ScreenUtil().setSp(26)
                                  )
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
      );
    }).toList();
    return listBtn;
  }


  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: false);
    return ListView(
      children: <Widget>[
        Container(
          width: ScreenUtil().setWidth(750),
          height: ScreenUtil().setWidth(240),
          child: new Image(
            image: NetworkImage('http://images.zastatic.com/app/live/banner/live_list_banner_i2.jpg'),
            fit: BoxFit.fill,
          ),
        ),
        Column(
          children: generatorList(),
        )
      ],
    );
  }
}


class FaceLive extends StatelessWidget {
  final topBar = new AppBar(
      backgroundColor: new Color.fromRGBO(120, 96, 229, 1) ,
      centerTitle: true,
      automaticallyImplyLeading: false,
      title: Text(
          '直播',
          style: TextStyle(color: new Color.fromRGBO(255, 255, 255, 1) )
      )
  );

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: topBar,
        body: FaceLiveBody(),
        bottomNavigationBar: new FooterNav(name: 'faceLive')
    );
  }
}

