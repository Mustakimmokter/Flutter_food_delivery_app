import 'package:flutter/material.dart';
import 'package:flutter_food_app1/featured/home/index.dart';
import 'package:flutter_food_app1/shared/models/index.dart';
import 'package:flutter_food_app1/shared/utils/index.dart';
import 'package:flutter_food_app1/shared/widgets_one/index.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class CustomFilter extends StatelessWidget {
  const CustomFilter({
    super.key,
    required this.clearFilter,
    required this.mostPopular,
    required this.mostPopularItem,
    required this.onChangeDrpDwn,
    required this.minPrice,
    required this.maxPrice,
    required this.ratting,
    required this.rattingIndex,
    required this.tagList,
    required this.tag,
    required this.isShowMore,
    required this.showMore,
    required this.applyFilter,
  });

  final VoidCallback clearFilter, showMore, applyFilter;
  final List<FoodName> mostPopular;
  final List<FoodName> tagList;
  final String mostPopularItem, minPrice, maxPrice;
  final Function(String?) onChangeDrpDwn;
  final Function(int) ratting, tag;
  final int rattingIndex;
  final bool isShowMore;

  @override
  Widget build(BuildContext context) {
    final filterProvider = Provider.of<FilterProvider>(context);
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              CustomContainer(
                height: 05,
                width: 50,
                color: Colors.grey.shade400,
              ),
              const SizedBox(height: 15),
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const CustomTextOne(
                    text: 'Filter',
                    textColor: Colors.black87,
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                  CustomTextBtn(
                    text: 'Clear Filter',
                    onTap: clearFilter,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Sort By
              _pointHeaderText('Sort By'),
              const SizedBox(height: 08),
              CustomContainer(
                padding: const EdgeInsets.only(left: 16, right: 16),
                height: 28,
                radius: 04,
                color: Colors.transparent,
                width: double.maxFinite,
                borderColor: Colors.deepOrange,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomTextOne(text: mostPopularItem),
                    DropdownButton<String>(
                      isDense: true,
                      enableFeedback: true,
                      items: List.generate(
                        mostPopular.length - 7,
                        (index) => DropdownMenuItem(
                          value: mostPopular[index].name,
                          child: CustomTextOne(
                            text: mostPopular[index].name,
                          ),
                        ),
                      ),
                      onChanged: onChangeDrpDwn,
                      icon: SvgPicture.asset(
                        'assets/icons/drop_down.svg',
                      ),
                      borderRadius: BorderRadius.circular(08),
                      iconSize: 28,
                      underline: const SizedBox(),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Price filter
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _pointHeaderText('Price'),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      CustomTextOne(
                        text: minPrice,
                      ),
                      const SizedBox(width: 10),
                      Padding(
                        padding: EdgeInsets.only(
                          left: filterProvider.sliderValue.end * 2.5,
                        ),
                        child: CustomTextOne(
                          text: maxPrice,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 05),
                  // Price Slider
                  SliderTheme(
                    data: SliderThemeData(
                      trackHeight: 05,
                      overlayShape: SliderComponentShape.noThumb,
                      inactiveTrackColor: brandSecondaryColor,
                    ),
                    child: RangeSlider(
                      min: 2,
                      max: 100,
                      activeColor: brandColor,
                      labels: RangeLabels(
                        filterProvider.sliderValue.start.toStringAsFixed(0),
                        filterProvider.sliderValue.end.toStringAsFixed(0),
                      ),
                      values: filterProvider.sliderValue,
                      onChanged: filterProvider.getSliderValue,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20),
              // Rating
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _pointHeaderText('Rating'),
                  const SizedBox(height: 08),
                  Row(
                    children: List.generate(
                      5,
                      (index) => GestureDetector(
                        onTap: () {
                          ratting(index);
                        },
                        child: CustomContainer(
                          margin: const EdgeInsets.only(right: 15),
                          color: index + 1 == rattingIndex
                              ? brandColor
                              : brandSecondaryColor,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 08, vertical: 03),
                            child: Row(
                              children: [
                                CustomTextOne(
                                  text: '${index + 1}',
                                  textColor: index + 1 == rattingIndex
                                      ? Colors.white
                                      : brandSGrayColor,
                                  fontSize: 14,
                                ),
                                const SizedBox(width: 05),
                                Icon(
                                  Icons.star,
                                  color: index + 1 == rattingIndex
                                      ? Colors.white
                                      : brandSGrayColor,
                                  size: 14,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Tags
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _pointHeaderText('Tags'),
                  const SizedBox(height: 08),
                  Wrap(
                    children: List.generate(
                      isShowMore ? tagList.length : 9,
                      (index) => GestureDetector(
                        onTap: () {
                          tag(index);
                        },
                        child: CustomContainer(
                          margin: const EdgeInsets.only(right: 10, bottom: 08),
                          color: tagList[index].isItem
                              ? brandColor
                              : brandSecondaryColor,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 08, vertical: 03),
                            child: CustomTextOne(
                              text: tagList[index].name,
                              textColor: tagList[index].isItem
                                  ? Colors.white
                                  : brandSGrayColor,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  CustomTextBtn(
                    text: 'Show more',
                    onTap: showMore,
                  ),
                ],
              ),
            ],
          ),
          CustomBtn(
            height: 50,
            text: 'Apply Filter',
            borderRadius: 50,
            onPressed: applyFilter,
          ),
        ],
      ),
    );
  }

  Widget _pointHeaderText(String text) {
    return CustomTextOne(
      text: text,
      textColor: Colors.black,
      fontWeight: FontWeight.w500,
      fontSize: 17,
    );
  }
}
