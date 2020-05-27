import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zhenai/components/footer_nav.dart';
import '../model.dart';
import '../redux/store.dart';



class AddItemWidget extends StatefulWidget {
  final ViewModel model;
  AddItemWidget(this.model);

  @override
  _AddItemState createState() => _AddItemState();
}

class _AddItemState extends State<AddItemWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.model.onAddItem('nihao');
      },//点击
      child: new Icon(Icons.add),
    );
  }
}




class SelfBody extends StatefulWidget {
  @override
  _SelfBody createState() => new _SelfBody();
}

class _SelfBody extends State<SelfBody> {
  String myName = '陈建芳';
  int age = 18;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: false);
    return Column(
      children: [
        Text(myName),
        Text(age.toString()),
        StoreConnector<AppState, ViewModel>(
          converter: (store) => ViewModel.create(store),
          builder: (context, ViewModel viewModel) {
            return new Text(
              '${viewModel.items.length}',
            );
          },
        ),
        StoreConnector<AppState, ViewModel>(
          converter: (store) => ViewModel.create(store),
          builder: (context,  ViewModel viewModel) {
            return AddItemWidget(viewModel);
          },
        ),
        StoreConnector<AppState, ViewModel>(
          converter: (store) => ViewModel.create(store),
          builder: (context, ViewModel viewModel) {
            return new Text(
              '${viewModel.count}',
            );
          },
        ),
        StoreConnector<AppState, ViewModel>(
          converter: (store) => ViewModel.create(store),
          builder: (context,  ViewModel viewModel) {
            return GestureDetector(
              onTap: () {
                viewModel.increment();
              },//点击
              child: new Icon(Icons.add),
            );
          },
        ),

      ],
    );
  }
}


class Self extends StatelessWidget {
  final topBar = new AppBar(
      backgroundColor: new Color.fromRGBO(255, 255, 255, 1) ,
      centerTitle: false,
      automaticallyImplyLeading: false,
      title: Text(
          '我',
          style: TextStyle(color: new Color.fromRGBO(66, 71, 92, 1) )
      ),
      actions: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: ScreenUtil().setWidth(100),
              height: ScreenUtil().setWidth(50),
              alignment: Alignment.center,
              margin: EdgeInsets.all(ScreenUtil().setWidth(20)),
              child: Text(
                  '编辑',
                  style: TextStyle(
                      color: new Color.fromRGBO(66, 71, 92, 1),
                      fontSize: ScreenUtil().setSp(34)
                  )
              ),
            )

          ],
        )
      ],
  );

  @override
  Widget build(BuildContext context) {

    ZhenaiStore.init();
    return new StoreProvider<AppState>(
        store: ZhenaiStore().store,
        child: new Scaffold(
          appBar: topBar,
          body: SelfBody(),
          bottomNavigationBar: new FooterNav(name: 'self')
        )
    );
  }
}

