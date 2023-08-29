class MyCategory {
  final int id;
  final String img;
  final String name;
  final List<String> brands;

  const MyCategory({
    required this.id,
    required this.img,
    required this.name,
    required this.brands,
  });

  static MyCategory smartphones = const MyCategory(
      id: 12, img: "https://i.imgur.com/VeJBDQj.png", name: "Smartphones", brands: ["Iphone", "Samsung", "Google"], );
  static MyCategory tablets = const MyCategory(
      id: 13,
      img:
          "https://www.hollywoodreporter.com/wp-content/uploads/2022/10/Apple-2022-iPad-Pro-12.9-in-EMBED-2022.jpg?w=1000",
      name: "Tablets", brands: ["Iphone","Samsung", "Lenovo"]);
  static MyCategory watches = const MyCategory(
      id: 14,
      img: "https://m.media-amazon.com/images/I/71OphXmiuuS._AC_UY1000_.jpg",
      name: "Watches", brands: ["Apple"]);
  static MyCategory headphones = const MyCategory(
      id: 15,
      img:
          "https://digilog.pk/cdn/shop/products/P47_Wireless_Bluetooth_Headphone_In_Lahore_Karachi_Islamabad_Peshawar_Quetta_Mardan_Multan_Sibbi_Hyderabad_Faisalabad_Pakistan__1.jpg?v=1687008455",
      name: "Headphones", brands: ["Sony"]);

  static List<MyCategory> items = [smartphones, tablets, watches, headphones];

  contains(String lowerCase) {}
}

