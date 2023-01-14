import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_food_app1/shared/utils/index.dart';
import 'package:flutter_food_app1/shared/widgets_one/index.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TrackScreen extends StatelessWidget {
  TrackScreen({super.key});

  final Completer<GoogleMapController> _controller =
  Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(23.80075693267697, 90.41371385434354),
    zoom: 14.4746,
  );

 // 23.80012868188494, 90.42487184325331
  //23.80075693267697, 90.41371385434354

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(23.80075693267697, 90.41371385434354),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            //mapType: MapType.normal,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: _controller.complete,
            zoomControlsEnabled: false,

          ),
          SizedBox(
            width: SizeUtils.screenWidth,
            height: SizeUtils.screenHeight,
            child: Padding(
              padding: const EdgeInsets.only(left: 20,right: 20,bottom: 30,top: 60),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomBackBtn(
                    onTap: () {
                      Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
                    },
                    title: 'Checkout',
                  ),
                  CustomContainer(
                    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                    height: 240,
                    width: double.maxFinite,
                    radius: 40,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade300,
                        blurRadius: 10,
                        spreadRadius: 02,
                        offset: const Offset(1, 1),
                      ),
                    ],
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      CustomContainer(
                        padding: const EdgeInsets.symmetric(horizontal: 13,),
                        width: double.maxFinite,
                        height: 50,
                        color: brandColor,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const CustomContainer(
                                  height: 33,
                                  width: 33,
                                  decorationImage: DecorationImage(
                                    image: AssetImage('assets/images/300_by_300_01.png'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                               const SizedBox(width: 10),
                               Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 mainAxisAlignment: MainAxisAlignment.center,
                                 children: [
                                  _text(
                                    text: 'Jackelyn perra',
                                    color: Colors.white,),
                                   const CustomTextOne(
                                    text: 'Delivery Girl',
                                    fontSize: 14,
                                    textColor: Colors.white,
                                    textOverflow: TextOverflow.ellipsis,
                    ),
                                 ],
                               ),
                              ],
                            ),
                            SvgPicture.asset('assets/icons/Phone Answer.svg',height: 33,),
                          ],
                        ),
                      ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                CustomContainer(
                                  padding: const EdgeInsets.all(05),
                                  alignment: Alignment.center,
                                  height: 38,
                                  width: 38,
                                  color: Colors.grey.shade200,
                                  child: SvgPicture.asset('assets/icons/rider.svg'),
                                ),
                                const SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const CustomTextOne(
                                      text: '03.20 pm',
                                      fontSize: 14,
                                      textColor: Colors.grey,
                                      textOverflow: TextOverflow.ellipsis,
                                    ),
                                    _text(
                                      text: 'On The Way',
                                      color: Colors.grey,),

                                  ],
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 18),
                              child: SvgPicture.asset('assets/icons/dot_line.svg'),
                            ),
                            Row(
                              children: [
                                CustomContainer(
                                  padding: const EdgeInsets.all(05),
                                  alignment: Alignment.center,
                                  height: 38,
                                  width: 38,
                                  color: Colors.grey.shade200,
                                  child: SvgPicture.asset('assets/icons/cheef.svg'),
                                ),
                                const SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const CustomTextOne(
                                      text: '03.10 pm',
                                      fontSize: 14,
                                      textColor: Colors.grey,
                                      textOverflow: TextOverflow.ellipsis,
                                    ),
                                    _text(
                                      text: 'Preparing Order',
                                      color: Colors.grey,),

                                  ],
                                ),
                              ],
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
        ],
      ),
    );
  }

  Widget _text({
    required String text,
    double? fontSize,
    Color? color,
  }){
    return  CustomTextOne(
      fontSize: fontSize,
      text: text,
      textColor: color,
      fontWeight: FontWeight.w500,
      textOverflow: TextOverflow.ellipsis,
    );
  }
}
