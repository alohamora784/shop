import 'package:flutter/material.dart';

import '../models/carddata.dart';

class CardProvider extends ChangeNotifier {
  final List<CardData> _cardBook = [];
  List<CardData> get cardBook => _cardBook;

  void addCard(CardData carddata) {
    _cardBook.add(carddata);
    notifyListeners();
  }

  void markDefault(int i) {
    _cardBook[i].IsDefault = true;
    for (var m = 0; m < _cardBook.length; m++) {
      if (m != i) {
        _cardBook[m].IsDefault = false;
      }
    }
    notifyListeners();
  }

  void deleteCard(int i) {
    _cardBook.removeAt(i);
    notifyListeners();
  }
}
