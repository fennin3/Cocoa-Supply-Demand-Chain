import 'dart:io';

import 'package:cocoa/models/pc_model.dart';
import 'package:cocoa/my_functions.dart';
import 'package:cocoa/utils/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class appState with ChangeNotifier{
  PCDetail? pcdetail;
  Size? size;
  bool loading = false;


  void init_state(context){
    size = MediaQuery.of(context).size;

    notifyListeners();
  }

  void getPCDetail()async{
    loading = true;
    pcdetail = await MyFunc.getPCDetail();
    loading = false;

    notifyListeners();
  }

  void requestTruck(String truckId, context)async{
    loading = true;
    notifyListeners();

    final Map data = {
      "pc":pcdetail!.id.toString(),
      "districtOffice": truckId
    };
    try{
      http.Response response = await http.post(Uri.parse(baseUrl + "cocoa/v1/ptrequests"), body: data);
      if(response.statusCode < 206){
        MyFunc.showSnack(context: context, message: "Truck request sent successfully");
      }else{
        MyFunc.showSnack(context: context, message: "Sorry something went wrong");
      }
    }on SocketException{
      MyFunc.showSnack(context: context, message: "No internet connection");
    }
    loading = false;
    notifyListeners();


    Navigator.of(context).pop();
  }

}