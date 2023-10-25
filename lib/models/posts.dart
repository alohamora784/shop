class Post {
  final double price;
  final String title;
  final String description;
  final int id;
  final String thumbnail;
  final List productsliderimages;
  final String brands;
  final DateTime uploadtime;
  final String category;
  final int stock;
  final double rating;
  final double discountPercentage;
  bool isselected;
  String searchinfo() {
    return "  $title $description $brands$category".toLowerCase();
  }

  factory Post.fromJson(json) {
    return Post(
      id: json["id"],
      title: json["title"],
      price: json["price"].toDouble(),
      description: json["description"],
      thumbnail: json["thumbnail"],
      brands: json["brand"],
      uploadtime: DateTime.now(),
      productsliderimages: json["images"],
      category: json["category"],
      stock: json["stock"],
      rating: json["rating"].toDouble(),
      discountPercentage: json["discountPercentage"].toDouble(),
    );
  }
  Post({
    required this.price,
    required this.title,
    required this.description,
    required this.id,
    required this.thumbnail,
    required this.productsliderimages,
    required this.brands,
    required this.uploadtime,
    required this.category,
    required this.stock,
    required this.rating,
    required this.discountPercentage,
    this.isselected = true,
  });
}
