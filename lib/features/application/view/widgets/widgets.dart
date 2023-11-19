import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';
import 'package:ulearning_app/common/utils/image_res.dart';
import 'package:ulearning_app/common/widgets/image_widgets.dart';
import 'package:ulearning_app/features/home/view/home.dart';

var bottomTabs = <BottomNavigationBarItem>[
  BottomNavigationBarItem(
    icon: _bottomContainer(imagePath: ImageRes.home),
    activeIcon: _bottomContainer(
        imagePath: ImageRes.home, color: AppColors.primaryElement),
    label: "Home",
    backgroundColor: AppColors.primaryBackground,
  ),
  BottomNavigationBarItem(
    icon: _bottomContainer(imagePath: ImageRes.search),
    activeIcon: _bottomContainer(
        imagePath: ImageRes.search, color: AppColors.primaryElement),
    label: "Search",
    backgroundColor: AppColors.primaryBackground,
  ),
  BottomNavigationBarItem(
    icon: _bottomContainer(imagePath: ImageRes.play),
    activeIcon: _bottomContainer(
        imagePath: ImageRes.play, color: AppColors.primaryElement),
    label: "Play",
    backgroundColor: AppColors.primaryBackground,
  ),
  BottomNavigationBarItem(
    icon: _bottomContainer(imagePath: ImageRes.message),
    activeIcon: _bottomContainer(
        imagePath: ImageRes.message, color: AppColors.primaryElement),
    label: "Message",
    backgroundColor: AppColors.primaryBackground,
  ),
  BottomNavigationBarItem(
    icon: _bottomContainer(imagePath: ImageRes.profilePhoto),
    activeIcon: _bottomContainer(
        imagePath: ImageRes.profilePhoto, color: AppColors.primaryElement),
    label: "Profile",
    backgroundColor: AppColors.primaryBackground,
  ),
];

Widget _bottomContainer({
  double width = 16,
  double height = 16,
  String imagePath = ImageRes.home,
  Color color = AppColors.primaryFourElementText,
}) {
  return SizedBox(
    height: width.h,
    width: height.w,
    child: appImageWithColor(imagePath: imagePath, color: color),
  );
}

Widget appScreens({int index = 0}) {
  List<Widget> screens = [
    const Home(),
    Center(
        child: appImage(
            imagePath: ImageRes.search, width: 250, height: 250)),
    Center(
        child: appImage(
            imagePath: ImageRes.play,
            width: 250,
            height: 250)),
    Center(
        child: appImage(
            imagePath: ImageRes.message,
            width: 250,
            height: 250)),
    Center(
        child: appImage(
            imagePath: ImageRes.profilePhoto, width: 250, height: 250)),
  ];
  return screens[index];
}
