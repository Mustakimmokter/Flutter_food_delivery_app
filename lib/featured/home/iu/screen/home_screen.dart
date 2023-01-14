import 'package:flutter/material.dart';
import 'package:flutter_food_app1/featured/home/index.dart';
import 'package:flutter_food_app1/featured/home/iu/component/index.dart';
import 'package:flutter_food_app1/shared/utils/index.dart';
import 'package:flutter_food_app1/shared/widgets_one/drawer/drawer.dart';
import 'package:flutter_food_app1/shared/widgets_one/index.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
 const HomeScreen({super.key});



  @override
  Widget build(BuildContext context) {
    SizeUtils().init(context);
    return Scaffold(
      backgroundColor: const Color(0xffF8F6F6),
      body: SafeArea(
        child: SizedBox(
          height: SizeUtils.screenHeight,
          width: SizeUtils.screenWidth,
          child: Consumer<NavBerProvider>(
            builder: (context, navBerProvider, child) {
              return navBerProvider.screen[navBerProvider.selectedScreenIndex];
            },
          ),
        ),
      ),
      drawer: Drawer(
        width: SizeUtils.getProportionateScreenWidth(275),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, top: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Consumer<DrawerProvider>(
                builder: (context, drawerProvider, child) {
                  return CustomDrawer(
                    colorIndex: drawerProvider.colorIndex,
                    color: Colors.deepOrange,
                    onTap: (index) {
                      drawerProvider.getColorIndex(index);
                    },
                  );
                },
              ),
              // Sing Out Button
              IconAndTextBtn(
                color: Colors.deepOrange,
                icon: 'assets/icons/drawer_icons/signout.svg',
                title: 'Sing Out',
                onTap: () {
                  Navigator.pushNamed(context, '/login');
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomContainer(
        padding: const EdgeInsets.symmetric(horizontal: 35),
        height: 60,
        radius: 0,
        color: Colors.white,
        child: Consumer<NavBerProvider>(
          builder: (context, navBerProvider, child) {
            return CustomNavigationBar(
              selectIndex: navBerProvider.selectedScreenIndex,
              onTap: (index) {
                navBerProvider.getSelectedScreen(context,index);
              },
            );
          },
        ),
      ),
    );
  }
}
