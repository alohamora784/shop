import 'package:flutter/material.dart';
import 'package:smartphone_shop/models/address.dart';

class AddressProvider extends ChangeNotifier {
  final List<AddressBook> _addressBook = [];
  List<AddressBook> get addressBook => _addressBook;

  void addAddress(AddressBook address) {
    _addressBook.add(address);
    notifyListeners();
  }

  void editAddress(AddressBook address, int i) {
    _addressBook[i] = address;
    notifyListeners();
  }

  void deleteAddress(int i) {
    _addressBook.removeAt(i);
    notifyListeners();
  }
}
