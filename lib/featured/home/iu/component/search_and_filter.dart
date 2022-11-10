import 'package:flutter/material.dart';
import 'package:flutter_food_app1/shared/widgets_one/index.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchAndFilter extends StatelessWidget {
  const SearchAndFilter({super.key, required this.filterTap});
  final VoidCallback filterTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 35,
            child: CustomTextField(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              enabledBorderRadius: 50,
              enabledBorderColor: Colors.white,
              elevation: 07,
              focusBorderRadius: 50,
              focusBorderColor: Colors.white,
              fillColor: Colors.white,
              hintText: 'Search',
              prefixIcon: Padding(
                padding: const EdgeInsets.all(8),
                child: SvgPicture.asset(
                  'assets/icons/search.svg',
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 20),
        CustomFlatBtn(
          onTap: filterTap,
          child: CustomContainer(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 07,
            ),
            height: 35,
            width: 40,
            boxDecoration: BoxDecoration(
              color: Colors.deepOrangeAccent,
              borderRadius: BorderRadius.circular(50),
            ),
            child: SvgPicture.asset(
              'assets/icons/filter.svg',
            ),
          ),
        ),
      ],
    );
  }
}
