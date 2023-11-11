import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';

Widget text24Normal({
  required String text,
  Color color = AppColors.primaryText,
}) {
  return Text(
    text,
    textAlign: TextAlign.center,
    style: TextStyle(
      color: color,
      fontSize: 24,
      fontWeight: FontWeight.normal,
    ),
  );
}

Widget text16Normal({
  required String text,
  Color color = AppColors.primarySecondaryElementText,
}) {
  return Text(
    text,
    textAlign: TextAlign.center,
    style: TextStyle(
      color: color,
      fontSize: 16,
      fontWeight: FontWeight.normal,
    ),
  );
}

Widget text14Normal({
  required String text,
  Color color = AppColors.primaryThreeElementText,
}) {
  return Text(
    text,
    textAlign: TextAlign.start,
    style: TextStyle(
      color: color,
      fontSize: 14,
      fontWeight: FontWeight.normal,
    ),
  );
}

Widget textUnderline({String text = "Your text"}) {
  return GestureDetector(
    onTap: () {},
    child: Text(
      text,
      style:  TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.normal,
        decoration: TextDecoration.underline,
        decorationColor: AppColors.primaryText,
        color: AppColors.primaryText,
      ),
    ),
  );
}
