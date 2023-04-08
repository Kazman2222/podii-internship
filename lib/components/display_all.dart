import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:shopper/routes/routes.dart';
import 'package:google_fonts/google_fonts.dart';

import 'cart_model.dart';
import 'grocery.dart';
import 'items.dart';

class display_all extends StatelessWidget {
  const display_all({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        margin: EdgeInsets.all(30),
        child:  Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.arrow_back_ios),
                Text('All Categories',style: GoogleFonts.inter(textStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 22)),)
              ],
            ),
            Consumer<CartModel>(builder: ((context, value, child) {
              return ListView.builder(

             
                  shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                  itemCount: value.shopItems.length,
                  itemBuilder: ((context, index) {
                    return GroceryListTile(
                      itemName: value.shopItems[index][0],
                      itemPrice: value.shopItems[index][1],
                      itemImage: value.shopItems[index][2],
                      quantityItem: value.shopItems[index][3],
                      onPressed: () {
                        Navigator.of(context).pushNamed(
                                                routeManager.displayPage,
                                                arguments: {
                                                  'name': value.shopItems[index]
                                                      [0],
                                                  'price': value.shopItems[index]
                                                      [1],
                                                  'image': value.shopItems[index]
                                                      [2],
                                                  'description':
                                                      value.shopItems[index][4],
                                                  'indexs': index,
                                                  'quantity':
                                                      value.shopItems[index][3]
                                                });
                      
                      },
                    );
                  }));
            })),
          ],
        ),
      ),
    )
    );
  }
}