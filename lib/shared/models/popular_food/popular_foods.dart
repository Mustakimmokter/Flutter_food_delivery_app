class PopularFoods {
  PopularFoods({
    this.quantity = 1,
    this.price,
    this.foodItem,
    this.foodName,
    this.isCart = true,
    this.isFavorite = true,
  });

  final String? foodItem, foodName;
  late int quantity;
  final double? price;
  late bool isCart;
  late bool isFavorite;
}
