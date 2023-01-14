import 'package:flutter/material.dart';
import 'package:flutter_food_app1/featured/home/index.dart';
import 'package:flutter_food_app1/featured/home/iu/component/filter.dart';
import 'package:flutter_food_app1/shared/utils/index.dart';
import 'package:flutter_food_app1/shared/widgets_one/index.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class SearchAndFilter extends StatelessWidget {
  const SearchAndFilter({super.key, required this.onChange, this.controller,
    required this.onSearch,
  });
  final Function(String) onChange;
  final TextEditingController? controller;
  final VoidCallback onSearch;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 05, left: 20, right: 20),
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              height: 35,
              child: CustomTextField(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                textEditingController: controller,
                onChange: onChange,
                onSubmitted: (value){
                  onSearch();
                },
                enabledBorderRadius: 50,
                enabledBorderColor: Colors.white,
                elevation: 07,
                focusBorderRadius: 50,
                focusBorderColor: Colors.white,
                fillColor: Colors.white,
                hintText: 'Search',
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(8),
                  child: GestureDetector(
                    onTap: onSearch,
                    child: SvgPicture.asset(
                      'assets/icons/search.svg',
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 20),
          CustomFlatBtn(
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
            onTap: () {
              showModalBottomSheet<dynamic>(
                isScrollControlled: true,
                context: context,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
                builder: (context) {
                  return SizedBox(
                      height:
                      SizeUtils.getProportionateScreenHeight(640),
                      child: Consumer<FilterProvider>(builder: (context, filterProvider, child) {
                        return CustomFilter(
                          clearFilter: (){
                            filterProvider.getClearFilter();
                          },
                          minPrice: '\$${filterProvider.sliderValue.start.toInt()}',
                          maxPrice: '\$${filterProvider.sliderValue.end.toInt()}',
                          mostPopularItem: filterProvider.dropDownValue,
                          mostPopular: filterProvider.sortBy,
                          onChangeDrpDwn: (value){
                            filterProvider.getDropdown(value!);
                          },
                          rattingIndex: filterProvider.rating,
                          ratting: (index){
                            filterProvider.getRating(index);
                          },
                          isShowMore: filterProvider.showMore,
                          tag: (index){
                            filterProvider.getTags(index);
                          },
                          tagList: filterProvider.tagItems,
                          showMore: (){
                            filterProvider.getShowMore();
                          },
                          applyFilter: (){
                            Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
                          },

                        );
                      },),
                  );
                },
              );
            },

          ),
        ],
      ),
    );
  }
}
