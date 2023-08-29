import 'package:smartphone_shop/models/posts.dart';

import 'category.dart';
import 'objectclass.dart';

class ProductTable {
  static List<Post> items = [
    Post(
        name: "iPhone 14 \n  Pro Max",
        price: 900.99,
        title: "iPhone 14 Pro Max",
        description:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
        id: 10,
        sliderimage: "https://www.thetechoutlook.com/wp-content/uploads/2022/08/Untitled-design-7-4.jpg",
        productsliderimages: [
          "https://media.cnn.com/api/v1/images/stellar/prod/220907141408-13-apple-event-far-out-0907-screenshot.jpg?c=original",
          "https://www.apple.com/v/iphone-14-pro/h/images/key-features/hero/hero__cj6i78tzkp8i_large.jpg",
          "https://images.news18.com/ibnlive/uploads/2022/09/apple-iphone-14-pro-launch-2022-16625743583x2.jpg",
        ],
        brands: "iPhone",
        uploadtime: DateTime.now(),
        category: MyCategory.smartphones),
    Post(
        name: "Samsung Galaxy \n  s22 Ultra",
        price: 1100,
        title: "Samsung Galaxy s22 Ultra",
        description:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
        id: 11,
        sliderimage: "https://akm-img-a-in.tosshub.com/indiatoday/images/story/202112/Galaxy_S22_Ultra_cam.jpg?size=690:388",
        productsliderimages: [
          "https://amateurphotographer.com/wp-content/uploads/sites/7/2023/02/samsung_galaxy_s23ultra_Amy_Davies_003.jpg?w=900",
          "https://images.samsung.com/is/image/samsung/assets/ge/smartphones/galaxy-s23-ultra/images/290623/images/galaxy-s23-ultra-highlights-kv.jpg",
          "https://gudini.kg/image/catalog/Samsung/S23%20Ultra/1-galaxy-s23-ultra.jpg",
        ],
        brands: "Samsung",
        uploadtime: DateTime.now(),
        category: MyCategory.smartphones),
    Post(
        name: "Google\n Pixel 6 Pro",
        price: 893.99,
        title: "Google Pixel 6 Pro",
        description:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
        id: 12,
        sliderimage: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcToXRZjlcXHLG8PG3x5vIfACoAgfuJ52UP3NVv-Nc3Ss2IB7ivL",
        productsliderimages: [
          "https://amateurphotographer.com/wp-content/uploads/sites/7/2022/01/google-pixel-6-camera-bump-side-buttons.jpg?w=900",
          "https://assets.ayobandung.com/crop/0x0:0x0/750x500/webp/photo/2022/10/09/1762123815.jpg",
          "https://storage.googleapis.com/gweb-uniblog-publish-prod/images/Google_Pixel_6__Portfolio_Shot_345IXG4.width-1300.jpg",
        ],
        brands: "Google",
        uploadtime: DateTime.now(),
        category: MyCategory.smartphones),
    Post(
        name: "Samsung Galaxy \n  s22 Ultra",
        price: 800,
        title: "Samsung Galaxy s22 Ultra",
        description:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
        id: 13,
        sliderimage: "https://www.thetechoutlook.com/wp-content/uploads/2022/08/Untitled-design-7-4.jpg",
        productsliderimages: [
          "https://amateurphotographer.com/wp-content/uploads/sites/7/2023/02/samsung_galaxy_s23ultra_Amy_Davies_003.jpg?w=900",
          "https://images.samsung.com/is/image/samsung/assets/ge/smartphones/galaxy-s23-ultra/images/290623/images/galaxy-s23-ultra-highlights-kv.jpg",
          "https://gudini.kg/image/catalog/Samsung/S23%20Ultra/1-galaxy-s23-ultra.jpg",
        ],
        brands: "Samsung",
        uploadtime: DateTime.now(),
        category: MyCategory.smartphones),
    Post(
        name: "Samsung Galaxy \n  s22 Ultra",
        price: 850,
        title: "Samsung Galaxy s22 Ultra",
        description:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
        id: 14,
        sliderimage: "https://www.thetechoutlook.com/wp-content/uploads/2022/08/Untitled-design-7-4.jpg",
        productsliderimages: [
          "https://amateurphotographer.com/wp-content/uploads/sites/7/2023/02/samsung_galaxy_s23ultra_Amy_Davies_003.jpg?w=900",
          "https://images.samsung.com/is/image/samsung/assets/ge/smartphones/galaxy-s23-ultra/images/290623/images/galaxy-s23-ultra-highlights-kv.jpg",
          "https://gudini.kg/image/catalog/Samsung/S23%20Ultra/1-galaxy-s23-ultra.jpg",
        ],
        brands: "Samsung",
        uploadtime: DateTime.now(),
        category: MyCategory.smartphones),
    Post(
        name: "Apple Watch Series 6",
        price: 400,
        title: "Apple Watch Series 6",
        description:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
        id: 15,
        sliderimage:
            "https://www.apple.com/newsroom/images/product/watch/standard/Apple_watch-experience-for-entire-family-hero_09152020_big.jpg.large.jpg",
        productsliderimages: [
          "https://www.apple.com/v/apple-watch-se/j/images/overview/hero/hero__fmx18j9bq0ya_large.jpg",
          "https://www.itegra.no/productmedia/47500/apple_watch_se_cellular_44mm_hero_6-up_screen__usen.jpg?imwidth=600",
          "https://r.dam-img.rfdcontent.com/offers/011/076/697/600x600_smart_fit.jpg",
        ],
        brands: "Apple",
        uploadtime: DateTime.now(),
        category: MyCategory.watches),
  ];
  static List<Post> newitems =
      items.where((element) => element.price > 100).toList();
}
