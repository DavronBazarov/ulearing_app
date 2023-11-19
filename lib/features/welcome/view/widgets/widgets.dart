import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/utils/constants.dart';
import 'package:ulearning_app/common/widgets/app_shadow.dart';
import 'package:ulearning_app/global.dart';

import '../../../../common/widgets/text_widgets.dart';

class AppOnBoardingPage extends StatelessWidget {
  final PageController controller;
  final String imagePath;
  final String title;
  final String subtitle;
  final int index;
  final BuildContext context;

  const AppOnBoardingPage({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.index,
    required this.context,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    log("AppOnBoardingPage class");
    return Column(
      children: [
        Image.asset(
          imagePath,
          fit: BoxFit.fitWidth,
        ),
        Container(
          margin: const EdgeInsets.only(top: 15),
          child: Text24Normal(text: title),
        ),
        Container(
          padding: EdgeInsets.only(left: 30.w, right: 30.w),
          margin: const EdgeInsets.only(top: 15),
          child: Text16Normal(text: subtitle),
        ),
        _nextButton(index, controller, context),
      ],
    );
  }
}


Widget _nextButton(int index, PageController controller, BuildContext context) {
  return GestureDetector(
    onTap: () {
      bool deviceFirstTime = Global.storageService.getDeviceFirstOpen();
      log("from tap = $deviceFirstTime");

      if (index < 3) {
        controller.animateToPage(
          index,
          duration: const Duration(milliseconds: 300),
          curve: Curves.linear,
        );
      } else {
        //remember we are first time or not
        Global.storageService
            .setBool(AppConstants.STORAGE_DEVICE_OPEN_FIRST_KEY, true);

        Navigator.pushNamed(context, '/sign_in');
      }
    },
    child: Container(
      width: 325.w,
      height: 50.h,
      margin: EdgeInsets.only(top: 50.h, left: 25.w, right: 25.w),
      decoration: appBoxShadow(),
      child: Center(
          child: Text16Normal(
              text: index < 3 ? "next" : "Get started", color: Colors.white)),
    ),
  );
}
