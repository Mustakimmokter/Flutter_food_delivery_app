import 'package:flutter/material.dart';
import 'package:flutter_food_app1/shared/utils/index.dart';
import 'package:flutter_food_app1/shared/widgets_one/index.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key,});

  @override
  Widget build(BuildContext context) {
    SizeUtils().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(Icons.arrow_back),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        CustomTextOne(
                          text: 'Forget Password',
                          textColor: Colors.deepOrangeAccent,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                        SizedBox(height: 10),
                        CustomTextOne(
                          text:
                              'Please enter you email to received a link\nto create a new password via mail',
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        // Email
                        CustomTextField(
                          contentPadding: const EdgeInsets.symmetric(horizontal: 18),
                          enabledBorderRadius: 100,
                          focusBorderRadius: 100,
                          hintText: 'Email',
                          onTap: () {},
                        ),
                        const SizedBox(height: 35),
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

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
