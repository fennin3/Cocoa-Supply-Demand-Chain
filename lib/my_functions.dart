import 'dart:convert';
import 'dart:io';

import 'package:cocoa/models/pc_model.dart';
import 'package:cocoa/routes.dart';
import 'package:cocoa/utils/constant.dart';
import 'package:cocoa/utils/pc_local_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;

class MyFunc{

  static Future<http.Response?>? login({type, userId, context}) async{
    final Map _body ={
      type:userId
    };
    http.Response response;
    try{
      response = await http.post(Uri.parse(baseUrl + MyRoutes.loggin), body: _body);
      return response;
    }
    on SocketException{
      EasyLoading.dismiss();
      const snackBar =  SnackBar(
        content: Text("No internet connection", textAlign: TextAlign.center, style: TextStyle(fontSize: 16),),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return null;
    }
  }

  static showSnack({context,message}){
    final snackBar = SnackBar(
      content: Text(message??"", textAlign: TextAlign.center, style: const TextStyle(fontSize: 16),),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static Future<PCDetail?>? getPCDetail()async{
    PCDetail? data;
    final ID = await UserLocalData.getPCID();
    http.Response response = await http.get(Uri.parse(baseUrl + "cocoa/v1/pcs/$ID"));

    if(response.statusCode < 206){
      data = PCDetail.fromJson(json.decode(response.body));
    }
    else{}

    return data;
  }
}