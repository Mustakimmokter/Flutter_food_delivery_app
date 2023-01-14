import 'package:flutter/material.dart';
import 'package:flutter_food_app1/shared/widgets_one/index.dart';

class UserDetails extends StatelessWidget {
  UserDetails({super.key});

  final List<String> _userDetails = [
    'My Order',
    'Payment Methods',
    'My Address',
    'Phone Number',
    'Email Address',
    'Help',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(_userDetails.length, (index) {
        return InkWell(
          onTap: () {
            print('My Order');
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomTextOne(
                  text: _userDetails[index],
                ),
                const Icon(Icons.arrow_forward_ios, size: 16),
              ],
            ),
          ),
        );
      }),
    );
  }
}
