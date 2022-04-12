import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


const double paddingHorizontal = 0.04;

const TextStyle pcDashBoardtext = TextStyle(fontSize: 19, fontWeight: FontWeight.bold, color: Colors.white);


const TextStyle pcMenuname = TextStyle(fontSize: 15, fontWeight: FontWeight.w600);

const Color appColor = Colors.lightBlueAccent;

// const baseUrl = "https://cocoaapi.herokuapp.com/";

const formDeco = InputDecoration(
    labelText: 'Enter Your Name',
    border: OutlineInputBorder(),
    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: appColor)),
    // enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: appColor)),
    errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red, width: 5)));

const baseUrl = "http://192.168.164.192:8000/";