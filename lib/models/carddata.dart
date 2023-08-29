class CardData {
  String type;
  String cardholdername;
  String cardnumber;
  String expirydate;
  String cvv;
  bool IsDefault;

  CardData({
    required this.type,
    required this.cardholdername,
    required this.cardnumber,
    required this.expirydate,
    required this.cvv,
    required this.IsDefault,
  });
}


