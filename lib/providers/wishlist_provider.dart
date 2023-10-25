

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../models/posts.dart';

class WishListProvider with ChangeNotifier {
  final List<Post> _wishlist = [];
  List<Post> get wishlist => _wishlist;
  String? _savedCategory;
  String? get savedCategory => _savedCategory;

  void wishlistaddremove(
    Post product,
  ) {
    if (_wishlist.contains(product)) {
      _wishlist.remove(product);
    } else {
      _wishlist.add(product);
    }
    product.isselected = !_wishlist.contains(product);
    notifyListeners();
  }

  List<Post> get getFilteredWishlist {
    if (_savedCategory == null) {
      return _wishlist;
    } else {
      return _wishlist
          .where((element) => element.category == _savedCategory)
          .toList();
    }
  }

  void getcategory(String selectedcategory) {
    if (selectedcategory == _savedCategory) {
      _savedCategory = null;
      notifyListeners();
      return;
    }
    _savedCategory = selectedcategory;

    notifyListeners();
  }
}
