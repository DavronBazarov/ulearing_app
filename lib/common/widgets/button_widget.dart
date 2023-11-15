import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';
import 'package:ulearning_app/common/widgets/app_shadow.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';


Widget appButton({
  String buttonName = "",
  double height = 50,
  double width = 325,
  bool isLogin = true,
  BuildContext? context,
   Function()? func,
}) {
  return GestureDetector(
    onTap: func,
    child: Container(
      height: height.h,
      width: width.w,
      decoration: appBoxShadow(
        border: Border.all(
          color: isLogin
              ? AppColors.primaryElement
              : AppColors.primaryFourElementText,
        ),
        color: isLogin ? AppColors.primaryElement : Colors.white,
      ),
      child: Center(
        child: text16Normal(
          text: buttonName,
          color: isLogin ? AppColors.primaryBackground : AppColors.primaryText,
        ),
      ),
    ),
  );
}
