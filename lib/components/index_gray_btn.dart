import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget indexGrayBtn(List<dynamic> list) {
  List<Widget> listBtn = list.map((item) {
    return (
        Container(
          child: ClipRRect(
              borderRadius: BorderRadius.circular(ScreenUtil().setWidth(24)),
              child: Container(
                  color: new Color.fromRGBO(242, 242, 242, 1),
                  padding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(30), ScreenUtil().setWidth(10), ScreenUtil().setWidth(30), ScreenUtil().setWidth(10)),
                  child: Text(
                      item.toString(),
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(28),
                        color: new Color.fromRGBO(102, 105, 120, 1),
                      )
                  )
              )
          ),
        )
    );
  }).toList();
  return Wrap(
    spacing: ScreenUtil().setWidth(30),
    runSpacing: ScreenUtil().setWidth(20),
    alignment: WrapAlignment.start,
    runAlignment: WrapAlignment.start,
    children: listBtn,
  );
}
