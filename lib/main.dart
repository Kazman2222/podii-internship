import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopper/components/cart_model.dart';
import 'package:shopper/routes/routes.dart';


void main() async {
 
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartModel(),
      builder: ((context, child) {
        return const MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          initialRoute: routeManager.homePage,
          onGenerateRoute: routeManager.routeSettings,
        );
      }),
    );
  }
}
