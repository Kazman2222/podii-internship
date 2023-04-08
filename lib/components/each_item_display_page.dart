import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'cart_model.dart';

class display_page extends StatelessWidget {
   final String name;
  final String price;
  final String image;
  final String description;
  final int indexs;
  final int quantity;
 
   display_page({
    super.key,
     required this.name,
      required this.price,
      required this.image,
      required this.description,
      required this.indexs,
      required this.quantity,
     
  });
   Index? index;

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
        appBar: AppBar(
          elevation: 0,
         
          
            backgroundColor: Colors.blue,
            centerTitle: true,
            title: Text(
              '$name',
              style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold)),
            )),
        body: Consumer<CartModel>(builder: (context, value, child) {
          return ListView.builder(
            itemCount: 1,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: Image(
                      image: NetworkImage(
                        '$image',
                      ),
                      height: 250,
                      width: 400,
                    ),
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          ' Name : $name',
                          style: GoogleFonts.montserrat(
                              textStyle:
                                  TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        Text(
                          ' Price : ' + '\$' + '$price',
                          style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue)),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Container(
                    height: 700,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 236, 234, 234),
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15))
                    ),
                    child: Column(
                      children: [
                         Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Description : $description',
                      style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                              fontWeight: FontWeight.w400, height: 4)),
                    ),
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Categories ',
                          style: GoogleFonts.acme(
                              textStyle: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22)),
                        ),
                        Text('Quantity :  $quantity',
                            style: GoogleFonts.acme(
                                textStyle: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22)))
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    margin: EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                side:
                                    BorderSide(color: Colors.grey, width: 1),
                                primary: Colors.white,
                                padding: EdgeInsets.all(8.0)),
                            onPressed: (() {}),
                            child: Text(
                              '20Kg',
                              style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(color: Colors.black)),
                            )),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                side:
                                    BorderSide(color: Colors.grey, width: 1),
                                primary: Colors.white,
                                padding: EdgeInsets.all(8.0)),
                            onPressed: (() {}),
                            child: Text(
                              '30Kg',
                              style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(color: Colors.black)),
                            )),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                side:
                                    BorderSide(color: Colors.grey, width: 1),
                                primary: Colors.white,
                                padding: EdgeInsets.all(8.0)),
                            onPressed: (() {}),
                            child: Text(
                              '40Kg',
                              style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(color: Colors.black)),
                            )),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 70.0,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                       ElevatedButton.icon(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Colors.blue,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 70.0, vertical: 25.0),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                      5.0,
                                    )),
                                  ),
                                  onPressed: (() {
                                    index = indexs;

                                    Provider.of<CartModel>(context,
                                            listen: false)
                                        .addItems(index);
                                  
                                  }),
                                  label: Text(
                                    'Add to cart',
                                    style: GoogleFonts.montserrat(
                                        textStyle: TextStyle(
                                            color: Colors.white, fontSize: 16)),
                                  ),
                                  icon: Icon(
                                    Icons.shopping_cart,
                                    color: Colors.black,
                                    size: 19,
                                  ),
                                ),
                       
                      ],
                    ),
                  ),
                      ],
                    ),
                  ),
                 
                 
                ],
              );
            },
          );
        }));
  }
}