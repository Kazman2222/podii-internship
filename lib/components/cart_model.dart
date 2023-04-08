import 'package:flutter/cupertino.dart';

class CartModel extends ChangeNotifier {
  final List _shopItems = [
    [
      "Orange",
      "4.00",
      'https://media.istockphoto.com/id/185284489/photo/orange.jpg?s=612x612&w=0&k=20&c=m4EXknC74i2aYWCbjxbzZ6EtRaJkdSJNtekh4m1PspE=',
      0,
       'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available. '
    ],
    [
      "BlueBerry",
      "24.00",
      'https://media.istockphoto.com/id/108311169/photo/blueberries.jpg?s=612x612&w=0&k=20&c=Y3lLlGAVi76ygoIR0mFgkQvd37kC0qe11i3-_GDCJwI=',
      0,
      'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available. '
    ],
    [
      "Avocado",
      "14.00",
      'https://media.istockphoto.com/id/1359819435/photo/halves-of-fresh-avocado-on-a-cutting-board.jpg?s=612x612&w=0&k=20&c=1q6XCEdUL3lHq4B5Mur9dLSZy5Q_zmFWZs96pDioNqU=',
      0,
      'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available. '
    ],
    [
      "Melon",
      "40.00",
      'https://media.istockphoto.com/id/1393880869/photo/sliced-watermelon-decorated-with-mint-leaves-on-brown-wooden-background-close-up-selective.jpg?s=612x612&w=0&k=20&c=orfPvdo_1BtO89-jv-OTnYagggOy5qrynk47wna2muE=',
      0,
      'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available. '
    ]
  ];
  final List _cartItems = [];
  get shopItems => _shopItems;

  get cartItems => _cartItems;

  void addItems(int index) {
    if (!_cartItems.contains(shopItems[index])) {
      _cartItems.add(shopItems[index]);
      print(_shopItems[index][3] + 1);
      _shopItems[index][3] = _shopItems[index][3] + 1;
     // _shopItems[index][3].toString();
    } else {
      print('it has been added');
        _shopItems[index][3] = _shopItems[index][3] + 1;
    }
    notifyListeners();
  }

  void removeItems(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  String calculateTotal() {
    double totalPrice = 0;
    for (int i = 0; i < _cartItems.length; i++) {
      totalPrice += double.parse(_cartItems[i][1]) * _cartItems[i][3] ;
    }
    return   totalPrice.toStringAsFixed(2);
  }
}
