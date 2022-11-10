import 'package:flutter/material.dart';
import 'package:flutter_food_app1/shared/utils/index.dart';
import 'package:flutter_food_app1/shared/widgets_one/index.dart';

class ForgetPassword extends StatelessWidget {
  ForgetPassword({
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
            vertical: SizeUtils.screenHeight / 90),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: SizeUtils.screenHeight / 20),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomTextOne(
                        text: 'Forget Password',
                        textColor: Colors.deepOrangeAccent,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                      SizedBox(height: SizeUtils.screenHeight / 70),
                      const CustomTextOne(
                        text:
                            'Please enter you email to received a link\nto create a new password via mail',
                      ),
                    ],
                  ),
                  SizedBox(),
                  Padding(
                    padding: EdgeInsets.only(bottom: 40),
                    child: Column(
                      children: [
                        // Email
                        CustomTextField(
                          contentPadding: EdgeInsets.symmetric(horizontal: 18),
                          enabledBorderRadius: 100,
                          focusBorderRadius: 100,
                          hintText: 'Email',
                          onTap: () {},
                        ),
                        SizedBox(height: SizeUtils.screenHeight / 25),
                        // Sign Btn
                        CustomBtn(
                          height: 50,
                          borderRadius: 100,
                          text: 'Send',
                          textColor: Colors.white,
                          onPressed: () {},
                          backgroundColor: Colors.deepOrangeAccent,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
