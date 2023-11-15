import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';
import 'package:ulearning_app/common/utils/image_res.dart';

Widget appImage({
  String imagePath = ImageRes.defaultImg,
  double width = 16,
  double height = 16,
}) {
  return Image.asset(
    imagePath.isEmpty ? ImageRes.defaultImg : imagePath,
    height: height.h,
    width: width.w,
  );
}
Widget appImageWithColor({
  String imagePath = ImageRes.defaultImg,
  double width = 16,
  double height = 16,
  Color color =AppColors.primaryFourElementText,
}) {
  return Image.asset(
    imagePath.isEmpty ? ImageRes.defaultImg: imagePath,
    height: height.h,
    width: width.w,
    color: color,
  );
}
