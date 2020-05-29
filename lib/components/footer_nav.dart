import 'package:flutter/material.dart';
import 'package:zhenai/route.dart';

// 底部导航
class FooterNav extends StatefulWidget {
  final name;

  FooterNav({Key key, this.name}) : super(key: key);

  @override
  _FooterNav createState() => new _FooterNav();
}

class _FooterNav extends State<FooterNav> {
  String _activeName = 'index';
  void changeIndex(value) {
    setState((){
      _activeName = value;
    });
  }

  @override
  void initState() {
    super.initState();
    _activeName = widget.name;
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
        color: new Color.fromRGBO(66, 71, 92, 1),
        height: 110,
        alignment: Alignment.center,
        child: new BottomAppBar(
            child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  new NavItem(name: 'index', img: 'lib/images/rec_${_activeName == 'index' ? 'pink' : 'white'}.png', txt: '推荐', changeIndex: changeIndex),
                  new NavItem(name: 'faceLive', img: 'lib/images/live_${_activeName == 'faceLive' ? 'pink' : 'white'}.png', txt: '直播', changeIndex: changeIndex),
                  new NavItem(name: 'friendCircle', img: 'lib/images/explorer_${_activeName == 'friendCircle' ? 'pink' : 'white'}.png', txt: '动态', changeIndex: changeIndex),
                  new NavItem(name: 'message', img: 'lib/images/message_${_activeName == 'message' ? 'pink' : 'white'}.png', txt: '消息', changeIndex: changeIndex),
                  new NavItem(name: 'self', img: 'lib/images/me_${_activeName == 'self' ? 'pink' : 'white'}.png', txt: '我', changeIndex: changeIndex),
                ]
            )
        )
    );
  }
}

class NavItem extends StatefulWidget {
  final name;
  final img;
  final txt;
  final changeIndex;

  NavItem({Key key, this.name, this.img, this.txt, this.changeIndex}) : super(key: key);

  @override
  _NavItem createState() => new _NavItem();
}

class _NavItem extends State<NavItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          widget.changeIndex(widget.name);
          Navigator.of(context).push(CreateRoute.open(widget.name));
        },
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(widget.img,
              width: 30,
              height: 30,
            ),
            new Text(widget.txt)
          ],
        )
    );
  }
}
