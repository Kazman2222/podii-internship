import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:shopper/components/cart_items.dart';
import 'package:shopper/components/display_all.dart';
import 'package:shopper/components/each_item_display_page.dart';
import 'package:shopper/components/landing_page.dart';
import 'package:shopper/components/home.dart';

class routeManager {
  static const String homePage = '/';
  static const String shoppingPage = '/shoppingPage';
  static const String cartPage = '/cartPage';
  static const String displayPage = '/displayPage';

  static Route<dynamic> routeSettings(RouteSettings settings) {
    var valuePassed;
    if (settings.arguments != null) {
      valuePassed = settings.arguments as Map<String, dynamic>;
    }
    switch (settings.name) {
      case homePage:
        return MaterialPageRoute(builder: ((context) => const home()));
      case shoppingPage:
        return MaterialPageRoute(builder: ((context) => const hometwo()));
      case cartPage:
        return MaterialPageRoute(builder: ((context) => const cart()));
      case displayPage:
        return MaterialPageRoute(
            builder: ((context) => display_page(
                  name: valuePassed['name'],
                  price: valuePassed['price'],
                  image: valuePassed['image'],
                  description: valuePassed['description'],
                  indexs: valuePassed['indexs'],
                  quantity: valuePassed['quantity'],
                )));
      // Passing of each index to a new page as an argument when clicked.

      default:
        throw const FormatException('routes not found');
    }
  }
}
