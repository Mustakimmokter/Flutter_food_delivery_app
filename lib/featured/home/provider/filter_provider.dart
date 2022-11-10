import 'package:flutter/material.dart';
import 'package:flutter_food_app1/shared/models/index.dart';
import 'package:flutter_food_app1/shared/models/list_models.dart';

class FilterProvider extends ChangeNotifier {
  String _dropDownValue = 'Most Popular';
  RangeValues _currentRangeValues = const RangeValues(2, 100);
  int _rating = 4;
  bool _showMore = false;
  final List<FoodName> _tagItems = ModelList.getTagList();
  final List<FoodName> _sortBy = ModelList.getTagList();

  List<FoodName> get sortBy => _sortBy;
  String get dropDownValue => _dropDownValue;
  RangeValues get sliderValue => _currentRangeValues;
  int get rating => _rating;
  List<FoodName> get tagItems => _tagItems;
  bool get showMore => _showMore;

  // Dropdown
  void getDropdown(String value) {
    _dropDownValue = value;
    notifyListeners();
  }

  // Slider
  void getSliderValue(RangeValues value) {
    _currentRangeValues = value;
    notifyListeners();
  }

  // Rating
  void getRating(int index) {
    _rating = index + 1;
    notifyListeners();
  }

  // Show more
  void getShowMore() {
    _showMore = !_showMore;
    notifyListeners();
  }

  //Tag
  void getTags(int index) {
    _tagItems[index].isItem = !_tagItems[index].isItem;
    notifyListeners();
  }
}
