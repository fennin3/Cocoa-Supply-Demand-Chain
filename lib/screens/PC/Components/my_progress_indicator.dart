import 'package:cocoa/utils/constant.dart';
import 'package:flutter/material.dart';

class MyProgressIndicator extends StatelessWidget {
  const MyProgressIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(appColor),);
  }
}
