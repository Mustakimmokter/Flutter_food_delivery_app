import 'package:flutter/material.dart';
import 'package:flutter_food_app1/featured/home/index.dart';
import 'package:flutter_food_app1/shared/utils/index.dart';
import 'package:flutter_food_app1/shared/widgets_one/index.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class CustomFilter extends StatelessWidget {
  const CustomFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<FilterProvider>(
      builder: (context, filterProvider, child) {
        return Padding(
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 30),
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
                        onTap: () {
                          //ToDo:
                          print('Clear Filter');
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Sort By
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomTextOne(
                        text: 'Sort By',
                        textColor: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 17,
                      ),
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
                            CustomTextOne(text: filterProvider.dropDownValue),
                            DropdownButton<String>(
                              isDense: true,
                              enableFeedback: true,
                              items: List.generate(
                                filterProvider.sortBy.length - 7,
                                (index) => DropdownMenuItem(
                                  value: filterProvider.sortBy[index].name,
                                  child: CustomTextOne(
                                    text: filterProvider.sortBy[index].name,
                                  ),
                                ),
                              ),
                              onChanged: (value) {
                                filterProvider.getDropdown(value!);
                              },
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
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Price filter
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomTextOne(
                        text: 'Price',
                        textColor: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 17,
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          CustomTextOne(
                            text:
                                '\$${filterProvider.sliderValue.start.toInt()}',
                          ),
                          const SizedBox(width: 10),
                          Padding(
                            padding: EdgeInsets.only(
                              left: filterProvider.sliderValue.end * 2.5,
                            ),
                            child: CustomTextOne(
                              text:
                                  '\$${filterProvider.sliderValue.end.toInt()}',
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
                          onChanged: (value) {
                            filterProvider.getSliderValue(value);
                          },
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Rating
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomTextOne(
                        text: 'Rating',
                        textColor: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 17,
                      ),
                      const SizedBox(height: 08),
                      Row(
                        children: List.generate(
                          5,
                          (index) => GestureDetector(
                            onTap: () {
                              filterProvider.getRating(index);
                            },
                            child: CustomContainer(
                              margin: const EdgeInsets.only(right: 15),
                              color: index + 1 == filterProvider.rating
                                  ? brandColor
                                  : brandSecondaryColor,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 08, vertical: 03),
                                child: Row(
                                  children: [
                                    CustomTextOne(
                                      text: '${index + 1}',
                                      textColor:
                                          index + 1 == filterProvider.rating
                                              ? Colors.white
                                              : brandSGrayColor,
                                      fontSize: 14,
                                    ),
                                    const SizedBox(width: 05),
                                    Icon(
                                      Icons.star,
                                      color: index + 1 == filterProvider.rating
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
                      const CustomTextOne(
                        text: 'Tags',
                        textColor: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 17,
                      ),
                      const SizedBox(height: 08),
                      Wrap(
                        children: List.generate(
                          filterProvider.showMore
                              ? filterProvider.tagItems.length
                              : 9,
                          (index) => GestureDetector(
                            onTap: () {
                              filterProvider.getTags(index);
                              print(index + 1);
                              print(filterProvider.tagItems[index].isItem);
                            },
                            child: CustomContainer(
                              margin:
                                  const EdgeInsets.only(right: 10, bottom: 08),
                              color: filterProvider.tagItems[index].isItem
                                  ? brandColor
                                  : brandSecondaryColor,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 08, vertical: 03),
                                child: CustomTextOne(
                                  text: filterProvider.tagItems[index].name,
                                  textColor:
                                      filterProvider.tagItems[index].isItem
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
                        onTap: () {
                          filterProvider.getShowMore();
                        },
                      ),
                    ],
                  ),
                ],
              ),
              CustomBtn(
                height: 50,
                text: 'Apply Filter',
                borderRadius: 50,
                onPressed: () {
                  Navigator.pushNamed(context, '/home');
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
