import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

toastInfo(
   {String? msg,
  Color backgroundColor = Colors.black87,
  Color textColor = Colors.white,
}) {
  return Fluttertoast.showToast(
    msg: msg!,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.TOP,
    backgroundColor: backgroundColor,
    textColor: textColor,
    timeInSecForIosWeb: 5,
    fontSize: 16.sp,
  );
}
