import 'package:flutter/material.dart';
import 'package:zhenai/pages/login.dart';
import 'package:zhenai/pages/index.dart';
import 'package:zhenai/pages/face_live.dart';
import 'package:zhenai/pages/self.dart';
import 'package:zhenai/pages/message.dart';
import 'package:zhenai/pages/friend_circle.dart';

class CreateRoute {
  static open(page) {
    return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation){
          if (page == 'index') {
            return Index();
          } else if (page == 'login') {
            return Login();
          } else if (page == 'faceLive') {
            return FaceLive();
          } else if (page == 'self') {
            return Self();
          } else if (page == 'message') {
            return Message();
          } else if (page == 'friendCircle') {
            return FriendCircle();
          }
          return Index();
        },
        transitionsBuilder:(context, animation, secondaryAnimation, child) {
          return child;
        }
    );
  }
}
