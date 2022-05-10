import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DioHelper{
 static Dio? dio;

  static initail(){
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://homeeclinic.herokuapp.com/api/',
          receiveDataWhenStatusError: true,
          headers: {
            'Accept':'application/json',
          }
      )
    );
  }
  static Future<Response> getData({@required url, @required Map<String, dynamic>? query})async{

      dio!.options.headers = {
        'Accept':'application/json',
        'Authorization': 'Token 7a556c3e80f3818e6ab5803dab6796a0ebc104a8',
      };

    return await dio!.get(url, queryParameters: query);
  }

  static Future<Response> postData({@required url,@required Map<String, dynamic>? query, token})async{
    if(token != null){
      dio!.options.headers = {
        'Accept':'application/json',
        'Authorization': 'Token $token',
      };
    }
    return await dio!.post(url, queryParameters: query);
  }
}