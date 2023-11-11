import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/pages/welcome/widgets.dart';

import 'notifier/welcome_notifier.dart';

class Welcome extends ConsumerWidget {
  Welcome({super.key});

  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(indexDotProvider);
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          body: Container(
            margin: EdgeInsets.only(top: 30.h),
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                //showing our three pages
                PageView(
                  onPageChanged: (value) {
                    ref.read(indexDotProvider.notifier).changeIndex(value);
                  },
                  controller: _controller,
                  scrollDirection: Axis.horizontal,
                  children: [
                    //first page
                    appOnBoardingPage(
                      _controller,
                      imagePath: "assets/images/reading.png",
                      title: "First See Learning",
                      subtitle:
                          "Forget about of paper, now learning all in one place",
                      index: 1,
                      context: context,
                    ),
                    //second page
                    appOnBoardingPage(
                      _controller,
                      imagePath: "assets/images/man.png",
                      title: "Connect with Everyone",
                      subtitle:
                          "Always keep in touch with your tutor and friends. Let's get connected",
                      index: 2,
                      context: context,
                    ),
                    //Third page
                    appOnBoardingPage(
                      _controller,
                      imagePath: "assets/images/boy.png",
                      title: "Always Fascinated Learning",
                      subtitle:
                          "Anywhere, anytime. The time is at your discretion. So study wherever you can",
                      index: 3,
                      context: context,
                    ),
                  ],
                ),
                //for showing dots
                Positioned(
                  // left: 20,
                  bottom: 80,
                  child: DotsIndicator(
                    position: index,
                    mainAxisAlignment: MainAxisAlignment.center,
                    dotsCount: 3,
                    decorator: DotsDecorator(
                        size: const Size.square(9.0),
                        activeSize: const Size(24.0, 8.0),
                        activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.w),
                        )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
