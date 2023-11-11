import 'package:flutter/material.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';

BoxDecoration appBoxShadow({
  Color color = AppColors.primaryElement,
  double radius = 15,
  double sR = 1,
  double bR = 2,
  BoxBorder? border,
}) {
  return BoxDecoration(
    color: color,
    borderRadius: BorderRadius.circular(15),
    border: border,
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.1),
        spreadRadius: sR,
        blurRadius: bR,
        offset: const Offset(0, 1),
      )
    ],
  );
}

BoxDecoration appBoxDecorationTextField({
  Color color = AppColors.primaryBackground,
  Color borderColor = AppColors.primaryFourElementText,
  double radius = 15,
}) {
  return BoxDecoration(
    color: color,
    borderRadius: BorderRadius.circular(15),
    border: Border.all(
      color: borderColor,
    ),
  );
}
