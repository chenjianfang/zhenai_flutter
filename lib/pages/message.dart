import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zhenai/components/footer_nav.dart';
import '../model.dart';
import '../redux/store.dart';

class MessageBody extends StatefulWidget {
  @override
  _MessageBody createState() => new _MessageBody();
}

class _MessageBody extends State<MessageBody> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: false);
    return Column(
      children: [
        Text('dddd'),
        StoreConnector<AppState, ViewModel>(
          converter: (store) => ViewModel.create(store),
          builder: (context, ViewModel viewModel) {
            return new Text(
              viewModel.items.toString(),
            );
          },
        ),
        StoreConnector<AppState, ViewModel>(
          converter: (store) => ViewModel.create(store),
          builder: (context, ViewModel viewModel) {
            return new Text(
              '${viewModel.count}',
            );
          },
        )
      ],
    );
  }
}


class Message extends StatelessWidget {
  final topBar = new AppBar(
    backgroundColor: new Color.fromRGBO(255, 255, 255, 1) ,
    centerTitle: false,
    automaticallyImplyLeading: false,
    title: Text(
        '消息',
        style: TextStyle(color: new Color.fromRGBO(66, 71, 92, 1) )
    ),
  );

  @override
  Widget build(BuildContext context) {

    ZhenaiStore.init();
    return new StoreProvider<AppState>(
        store: ZhenaiStore().store,
        child: new Scaffold(
            appBar: topBar,
            body: MessageBody(),
            bottomNavigationBar: new FooterNav(name: 'message')
        )
    );
  }
}

