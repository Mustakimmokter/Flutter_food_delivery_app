import 'package:flutter_food_app1/shared/models/index.dart';

class ModelList {
  // Food items list
  static List<FoodItemList> getFoodItemList() {
    final _foodItemList = [
      const FoodItemList(
        foodName: 'Burger',
        foodItem: 'assets/images/food_items/burger.svg',
      ),
      const FoodItemList(
        foodName: 'Pizza',
        foodItem: 'assets/images/food_items/pizza.svg',
      ),
      const FoodItemList(
        foodName: 'Sushi',
        foodItem: 'assets/images/food_items/sushi.svg',
      ),
      const FoodItemList(
        foodName: 'Drink',
        foodItem: 'assets/images/food_items/drink.svg',
      ),
      const FoodItemList(
        foodName: 'Chicken',
        foodItem: 'assets/images/food_items/chicken.svg',
      ),
      const FoodItemList(
        foodName: 'Fruit',
        foodItem: 'assets/images/food_items/fruits.svg',
      ),
      const FoodItemList(
        foodName: 'Ice Cream',
        foodItem: 'assets/images/food_items/ice-cream.svg',
      ),
    ];

    return _foodItemList;
  }

  // Near Restaurants
  static List<NearRestaurants> getNearRestaurants() {
    final _nearRestaurants = [
      const NearRestaurants(
        name: 'KFC',
        logo: 'assets/rst_logo/KFC-Logo.svg',
      ),
      const NearRestaurants(
        name: 'Pizza Hut',
        logo: 'assets/rst_logo/Pizza_hut_logo.svg',
      ),
      const NearRestaurants(
        name: 'Burger King',
        logo: 'assets/rst_logo/Burger_King_logo.svg',
      ),
      const NearRestaurants(
        name: 'Chipotle Mexican',
        logo: 'assets/rst_logo/Chipotle_Mexican_Grill-Logo.svg',
      ),
      const NearRestaurants(
        name: 'Yum! Brands',
        logo: 'assets/rst_logo/Yum!_Brands-Logo.svg',
      ),
      const NearRestaurants(
        name: "McDonald's",
        logo: "assets/rst_logo/McDonald's-Logo.svg",
      ),
    ];
    return _nearRestaurants;
  }

  // Popular Food item
  static List<PopularFoods> getPopularFoods() {
    final _popularRestaurants = [
      PopularFoods(
        foodName: 'Burger',
        foodItem: 'assets/images/popular_foods/burger.svg',
        price: 2.40,
      ),
      PopularFoods(
        foodName: 'Sushi',
        foodItem: 'assets/images/popular_foods/sushi.svg',
        price: 3.00,
      ),
      PopularFoods(
        foodName: 'Pizza',
        foodItem: 'assets/images/popular_foods/pizza.svg',
        price: 5.30,
      ),
      PopularFoods(
        foodName: 'Hot Dog',
        foodItem: 'assets/images/popular_foods/hot-dog.svg',
        price: 4.50,
      ),
      PopularFoods(
        foodName: 'Chicken',
        foodItem: 'assets/images/popular_foods/chicken.svg',
        price: 2.10,
      ),
    ];
    return _popularRestaurants;
  }

  // Tags
  static List<FoodName> getTagList() {
    final _tags = [
      FoodName(name: 'Burger'),
      FoodName(name: 'Sushi'),
      FoodName(name: 'Pizza', isItem: true),
      FoodName(name: 'Drink'),
      FoodName(name: 'Rice'),
      FoodName(name: 'Fast Food'),
      FoodName(name: 'Breakfast'),
      FoodName(name: 'Lunch'),
      FoodName(name: 'Chicken'),
      FoodName(name: 'Beef'),
      FoodName(name: 'Sharma'),
      FoodName(name: 'Biryani')
    ];

    return _tags;
  }

  static List<FoodName> getSortBy() {
    final _tags = [
      FoodName(name: 'Burger'),
      FoodName(name: 'Sushi'),
      FoodName(name: 'Pizza'),
      FoodName(name: 'Drink'),
      FoodName(name: 'Chicken'),
      FoodName(name: 'Beef'),
    ];

    return _tags;
  }
}
