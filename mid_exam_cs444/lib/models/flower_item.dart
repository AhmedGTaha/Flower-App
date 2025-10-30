class FlowerItem {
  String name;
  String description;
  double price;
  String category;
  String colorName;
  String image;
  double discount;
  bool available;

  FlowerItem({
    required this.name,
    required this.description,
    required this.price,
    required this.category,
    required this.colorName,
    required this.image,
    required this.discount,
    required this.available,
  });

  double get finalPrice => price * (1 - (discount.clamp(0, 100) / 100));
  String get availabilityText => available ? 'Available' : 'Out of stock';

  static final List<FlowerItem> items = [
    FlowerItem(
      name: 'Tulip',
      description: 'Nice',
      price: 10,
      category: 'General',
      colorName: 'Unknown',
      image: 'images/Flower1.jpg',
      discount: 0,
      available: true,
    ),
    FlowerItem(
      name: 'Rose',
      description: 'Rosy',
      price: 20,
      category: 'Rose',
      colorName: 'Red',
      image: 'images/Flower2.jpg',
      discount: 5,
      available: true,
    ),
    FlowerItem(
      name: 'Flower',
      description: 'Flower',
      price: 5,
      category: 'General',
      colorName: 'Blue',
      image: 'images/Flower3.jpg',
      discount: 0,
      available: false,
    ),
  ];
}
