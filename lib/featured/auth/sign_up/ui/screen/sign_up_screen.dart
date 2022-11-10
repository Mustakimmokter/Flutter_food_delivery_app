import 'package:flutter/material.dart';
import 'package:flutter_food_app1/shared/utils/index.dart';
import 'package:flutter_food_app1/shared/widgets_one/index.dart';

class SignUpScreenOne extends StatelessWidget {
  static String routeName = 'signup';

  SignUpScreenOne({
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
            horizontal: SizeUtils.screenWidth / 20,
            vertical: SizeUtils.screenHeight / 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: SizeUtils.screenHeight / 20),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back),
            ),
            SizedBox(),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 07, bottom: 06),
                    child: SizedBox(
                      width: 150,
                      child: CustomTextOne(
                        text: 'Create your account',
                        textColor: Colors.deepOrangeAccent,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      // Email
                      CustomTextField(
                        contentPadding: EdgeInsets.symmetric(horizontal: 18),
                        enabledBorderRadius: 100,
                        focusBorderRadius: 100,
                        hintText: 'Email',
                        onTap: () {},
                      ),
                      SizedBox(height: SizeUtils.screenHeight / 75),
                      // Password
                      const CustomTextField(
                        contentPadding: EdgeInsets.symmetric(horizontal: 18),
                        enabledBorderRadius: 100,
                        focusBorderRadius: 100,
                        hintText: 'Password',
                        obscureText: true,
                      ),

                      SizedBox(height: SizeUtils.screenHeight / 75),
                      // Phone
                      const CustomTextField(
                        contentPadding: EdgeInsets.symmetric(horizontal: 18),
                        enabledBorderRadius: 100,
                        focusBorderRadius: 100,
                        hintText: 'Phone',
                        textInputType: TextInputType.number,
                      ),
                      SizedBox(height: SizeUtils.screenHeight / 35),
                      // Sign Btn
                      CustomBtn(
                        height: 50,
                        borderRadius: 100,
                        text: 'Sign up',
                        textColor: Colors.white,
                        onPressed: () {
                          Navigator.pushNamed(context, '/home');
                        },
                        backgroundColor: Colors.deepOrangeAccent,
                      ),
                      SizedBox(height: SizeUtils.screenHeight / 45),
                      const Center(
                        child: CustomTextOne(
                            textAlign: TextAlign.center,
                            text:
                                'By Clicking Sign Up You To The Our\n Terms And Condition'),
                      ),
                    ],
                  ),
                  SizedBox(height: SizeUtils.screenHeight / 80),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // TextSpan(
                      //     text: 'Don\'t have an Account?',
                      //     style: TextStyle(
                      //       fontSize: 15,
                      //       color: Colors.black,
                      //     ),
                      //     children: [
                      //       TextSpan(
                      //         onEnter: (value) {
                      //           print('object');
                      //           Navigator.push(context,
                      //               MaterialPageRoute(builder: (_) => HomeScreen()));
                      //         },
                      //         text: ' Sing up',
                      //         style: TextStyle(
                      //           color: Colors.deepOrangeAccent,
                      //         ),
                      //       ),
                      //     ])

                      CustomTextOne(text: 'Already An Account?'),
                      SizedBox(width: 05),
                      GestureDetector(
                        child: const CustomTextOne(
                          text: 'Log in',
                          //textDecoration: TextDecoration.underline,
                          textColor: Colors.deepOrangeAccent,
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, '/login');
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
