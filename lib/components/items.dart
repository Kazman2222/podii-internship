import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shopper/components/cart_model.dart';
import 'package:shopper/components/grocery.dart';

class items extends StatelessWidget {
  final String itemName;
  final String itemPrice;
  final String itemImage;
  final int quantityItem;
  void Function()? onPressed;
  items(
      {super.key,
      required this.itemName,
      required this.itemPrice,
      required this.itemImage,
      required this.quantityItem,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
           
               Container(
            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 238, 236, 236),
              boxShadow: [
                BoxShadow(blurRadius: 3,color: Color.fromARGB(255, 80, 80, 80))
              ],
              borderRadius: BorderRadius.circular(10)
            ),
            height: 350,
            width: 300,
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image(
                      image: NetworkImage(itemImage),
                      width: 250,
                      height: 220,
                      fit: BoxFit.cover,
                    )),
                    const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          itemName,
                          
                          style: GoogleFonts.aboreto(
                              textStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          )),
                        ),
                       
                        const SizedBox(
                          height: 15.0,
                        ),
                        Text(
                          'Price :   \$' + itemPrice,
                          style: GoogleFonts.montserrat(
                              textStyle:
                                  TextStyle(color: Color.fromARGB(255, 139, 138, 138), fontSize: 14.0)),
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                      
                      ],
                      
                    ),
                    ElevatedButton(onPressed: onPressed, child: Text('Check Product', style: GoogleFonts.inter(textStyle: TextStyle(color: Colors.white)),
                    
                    ),
                    
                    style: ElevatedButton.styleFrom(padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20)),
                    )
                  
                 
                  
                      
                  ],
                )
              ],
            ),
          ),
          ],
        ),
      ),
    );
  }
}
