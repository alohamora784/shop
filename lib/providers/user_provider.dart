import 'package:flutter/material.dart';

import '../models/users.dart';

class UserProvider with ChangeNotifier {
  List<Users> _user = [];
  List<Users> get users => _user;

 void getuserdata(String username, List<Users> users) {
    _user = users.where((element) => element.username.toLowerCase() == username.toLowerCase()).toList();
    notifyListeners();
  }
}
