import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/widgets/button_widget.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';

import '../../common/widgets/app_bar.dart';
import '../../common/widgets/app_text_field.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: buildAppBar(),
          body: SingleChildScrollView(
            reverse: true,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30.h),
                //more login options message
                Center(
                  child: text14Normal(
                      text: "Enter your details below & free sign up"),
                ),
                SizedBox(height: 50.h),
                //user name text box
                appTextField(
                  text: 'User name',
                  iconPath: 'assets/icons/user.png',
                  hintText: "Enter your user name",
                ),
                SizedBox(height: 20.h),
                appTextField(
                  text: 'Email',
                  iconPath: 'assets/icons/user.png',
                  hintText: "Enter your email address",
                ),
                SizedBox(height: 20.h),
                //password text box
                appTextField(
                  text: 'Password',
                  iconPath: 'assets/icons/lock.png',
                  hintText: "Enter your password",
                  obscureText: true,
                ),
                SizedBox(height: 20.h),
                //password text box
                appTextField(
                  text: 'Confirm your password',
                  iconPath: 'assets/icons/lock.png',
                  hintText: "Confirm your password",
                  obscureText: true,
                ),
                SizedBox(height: 20.h),
                //forgot text
                Container(
                  margin: EdgeInsets.only(left: 25.w),
                  child: text14Normal(
                    text: "By creating an account you are agreeing with "
                        "our terms and condition",
                  ),
                ),
                SizedBox(height: 100.h),
                //app button register
                Center(
                  child: appButton(
                    buttonName: "Register",
                    isLogin: true,
                    context: context,
                    func: () {
                      print("Register");
                      Navigator.push(
                        context!,
                        MaterialPageRoute(
                          builder: (context) =>const SignUp(),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
