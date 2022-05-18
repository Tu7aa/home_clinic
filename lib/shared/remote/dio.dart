import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DioHelper{
 static Dio? dio;

  static initail(){
    dio = Dio(
      BaseOptions(
          baseUrl: 'https://clinichome.herokuapp.com/api/',
          receiveDataWhenStatusError: true,
          headers: {
            'Accept':'application/json',
          }
      )
    );
  }
  static Future<Response> getData({@required url, @required Map<String, dynamic>? query, token})async{
      dio!.options.headers = {
        'Accept':'application/json',
        'Authorization': 'Token $token',
      };

    return await dio!.get(url, queryParameters: query);
  }

  static Future<Response> postData({@required url,@required Map<String, dynamic>? query, token, @required Map<String, dynamic>? data})async{
      dio!.options.headers = {
        'Accept':'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Token $token',
      };

    return await dio!.post(url, queryParameters: query, data: data??null);
  }
}