import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shopper/routes/routes.dart';


import 'cart_model.dart';
import 'grocery.dart';

class product extends StatefulWidget {
  const product({super.key});

  @override
  State<product> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<product> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const SizedBox(height: 30,),
       Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
         child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             Column(
              children:  [
                Text('Welcome,', style: GoogleFonts.acme(textStyle: const TextStyle(fontWeight: FontWeight.bold)),),
                const SizedBox(height: 3,),
                Text('KAZEEM QUAYUM', style: GoogleFonts.montserrat(),)
              ],
             ),
            ClipRRect(
            borderRadius: BorderRadius.circular(90),
              child: const  Image(image: NetworkImage(
                'https://media.istockphoto.com/id/1364917563/photo/businessman-smiling-with-arms-crossed-on-white-background.jpg?s=612x612&w=0&k=20&c=NtM9Wbs1DBiGaiowsxJY6wNCnLf0POa65rYEwnZymrM='
                
                ),width: 60,height: 60,fit: BoxFit.cover,),
            )
           ],
         ),
       ),
       const SizedBox(height: 30,),
      Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
        child: const TextField(
          
            decoration: InputDecoration(
              
              fillColor: Colors.white,
              focusColor: Colors.black,
              prefixIcon: Icon(Icons.search,color: Colors.blue,),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: Color.fromARGB(255, 67, 67, 67))
              ),
                enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: Color.fromARGB(255, 65, 67, 67))
              )
            ),
         ),
      ),
       const SizedBox(height: 35,),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10.0,),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Categories',
                style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 20)),
              ),
            const  Icon(
                Icons.arrow_forward_ios,
                color: Colors.blue,
              ),
            ],
          ),
        ),
       
      
        const SizedBox(
          height: 10.0,
        ),
      
        Consumer<CartModel>(builder: ((context, value, child) {
          return Container(
            height: 400,
            child: ListView.builder(

         
                shrinkWrap: true,
               scrollDirection: Axis.horizontal,
                itemCount: 3,
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
                })),
          );
        }))
      ]),
    ),
    
    );
  }
}