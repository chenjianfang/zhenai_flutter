import 'dart:io';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:path_provider/path_provider.dart';


class CookieInstance {
  static PersistCookieJar _cookieJar;
  static String appDocPath;
  static Future<PersistCookieJar> get cookieJar async {
    if (_cookieJar == null) {
      Directory appDocDir = await getApplicationDocumentsDirectory();
      appDocPath  = appDocDir.path;
      _cookieJar = PersistCookieJar(dir: appDocPath, ignoreExpires: true);
    }
    return _cookieJar;
  }
}

BaseOptions options = new BaseOptions(
  contentType:Headers.formUrlEncodedContentType,
  baseUrl: 'http://api.zhenai.com',
  connectTimeout: 5000,
  receiveTimeout: 3000,
);

Dio dio = new Dio(options);

class Fetch{
  static get({String url = '', Map<String, dynamic>data}) async {
    if (data.isEmpty) {
      data = Map();
    }
    dio.interceptors.add(CookieManager((await CookieInstance.cookieJar)));
    Response res;
    try {
      res = await dio.get(url, queryParameters: data, options: Options(
          headers: {
            'cookie': 'serialNum=wapZhenaiAutoTest',
            'ua': 'mobile/6.15.0/18/8.4.1/iPhone/0f607264fc6318a92b9e13c65db7cd3c/902684/2/0/1334/750/6F212B1F-4FFF-4189-82ED-B657E62F2084/3/e7ea59f18379035f386f883f0a59ac10adcf664c/test'
          }
      ));
    } on DioError catch(e) {
      if(e.response == null) {
        print('e.response is null: ');
      } else{
        print('e.request ${e.request}');
        print(e.message);
      }
    }
    return res.data;
  }

  static post({String url = '', Map<dynamic, dynamic>data}) async {
    if (data.isEmpty) data = Map();
    dio.interceptors.add(CookieManager((await CookieInstance.cookieJar)));
    Response res;
    try {
      res = await dio.post(url, data: data, options: Options(
        headers: {
          'cookie': 'serialNum=wapZhenaiAutoTest',
          'ua': 'mobile/6.15.0/18/8.4.1/iPhone/0f607264fc6318a92b9e13c65db7cd3c/902684/2/0/1334/750/6F212B1F-4FFF-4189-82ED-B657E62F2084/3/e7ea59f18379035f386f883f0a59ac10adcf664c/test'
        }
      ));
      if (res.data['errorCode'] == '-00004') {
        (await CookieInstance.cookieJar).delete(Uri.parse('http://api.zhenai.com$url')); // 为什么没效果，呜呜呜呜
      }

    } on DioError catch(e) {
      print(e);
      if(e.response == null) {
        print('e.response is null: ');
      } else{
        print('e.request ${e.request}');
        print(e.message);
      }
    }
    print('res: $res');
    return res.data;
  }
}
