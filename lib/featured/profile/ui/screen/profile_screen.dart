import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food_app1/featured/profile/provider/profile_provider.dart';
import 'package:flutter_food_app1/featured/profile/ui/component/index.dart';
import 'package:flutter_food_app1/http_services/http_service.dart';
import 'package:flutter_food_app1/shared/models/profile/profile.dart';
import 'package:flutter_food_app1/shared/utils/index.dart';
import 'package:flutter_food_app1/shared/widgets_one/index.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    SizeUtils().init(context);
    final getProfile = Provider.of<ProfileProvider>(context);
    return Scaffold(
      body: SizedBox(
        height: SizeUtils.screenHeight,
        width: SizeUtils.screenWidth,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
          child: Column(
            children: [
              CustomBackBtn(
                onTap: () {
                  Navigator.pop(context);
                },
                title: 'My Profile',
              ),
              const SizedBox(height: 60),

              if (getProfile.isTrue)
                const LoaderTwo(
                  duration: Duration(milliseconds: 400),
                  colors: [
                    brandColor,
                    brandSGrayColor,
                  ],
                )
              else
                getProfile.data.avatar != null
                    ? CustomContainer(
                        height: 60,
                        width: 60,
                        borderColor: Colors.deepOrangeAccent,
                        borderWidth: 1.5,
                        decorationImage: DecorationImage(
                          image: NetworkImage(
                            getProfile.data.avatar!,
                          ),
                        ),
                      )
                    : Text('Not found'),
              SizedBox(height: 16),
              const CustomTextOne(
                text: 'Maruf Hossain',
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),
              SizedBox(height: 60),
              // User Details
              UserDetails(),
            ],
          ),
        ),
      ),
    );
  }
}
