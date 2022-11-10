import 'package:flutter/material.dart';
import 'package:flutter_food_app1/shared/utils/index.dart';
import 'package:flutter_food_app1/shared/widgets_one/index.dart';

class LoginScreenOne extends StatelessWidget {
  const LoginScreenOne({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeUtils().init(context);
    print('Width : ${SizeUtils.screenWidth / 10}');
    print('Height : ${SizeUtils.screenHeight / 10}');
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: SizeUtils.screenWidth / 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 20),
              child: CustomTextOne(
                text: 'Log in',
                textColor: Colors.deepOrangeAccent,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const CustomTextField(
                  contentPadding: EdgeInsets.symmetric(horizontal: 18),
                  enabledBorderRadius: 100,
                  focusBorderRadius: 100,
                  hintText: 'Email',
                ),
                SizedBox(height: SizeUtils.screenHeight / 70),
                const CustomTextField(
                  contentPadding: EdgeInsets.symmetric(horizontal: 18),
                  enabledBorderRadius: 100,
                  focusBorderRadius: 100,
                  hintText: 'Password',
                  obscureText: true,
                ),
                SizedBox(height: SizeUtils.screenHeight / 70),
                Padding(
                  padding: EdgeInsets.only(right: SizeUtils.screenWidth / 30),
                  child: GestureDetector(
                    child: const CustomTextOne(
                      text: 'Forget Password?',
                      textColor: Colors.deepOrangeAccent,
                      fontSize: 15,
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, '/forgetPassword');
                    },
                  ),
                ),
                SizedBox(height: SizeUtils.screenHeight / 30),
                CustomBtn(
                  height: 50,
                  borderRadius: 100,
                  text: 'Log in',
                  textColor: Colors.white,
                  onPressed: () {
                    Navigator.pushNamed(context, '/home');
                  },
                  backgroundColor: Colors.deepOrangeAccent,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CustomTextOne(text: 'Don\'t have an Account?'),
                SizedBox(width: 05),
                // Sing Up
                GestureDetector(
                  child: const CustomTextOne(
                    text: 'Sign up',
                    //textDecoration: TextDecoration.underline,
                    textColor: Colors.deepOrangeAccent,
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/signup');
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
