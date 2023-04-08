import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shopper/components/cart_model.dart';
import 'package:shopper/routes/routes.dart';

class cart extends StatelessWidget {
  const cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SingleChildScrollView(
      child: Consumer<CartModel>(
        builder: (context, value, child) {
          return Column(
            children: [
              ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: value.cartItems.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 10.0),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        alignment: Alignment.center,
                         decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                     color: Color.fromARGB(255, 224, 222, 222),
                  ),
                        margin: EdgeInsets.symmetric(vertical: 10.0,),
    width: double.infinity,
    height: 150,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.network(
                              value.cartItems[index][2],
                              width: 140,
                              height: 200,
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(value.cartItems[index][0],
                              style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(color: Colors.black,fontSize: 23))),
                                  const SizedBox(height: 10,),
                                   Text(
                                'price : ' +
                                    ' ' +'\$' +value.cartItems[index][1].toString(),
                                style: GoogleFonts.acme(
                                    textStyle: TextStyle(
                                        color: Color.fromARGB(255, 133, 132, 132)),fontSize: 20),
                                        
                              ),
                              const SizedBox(height: 10,),
                               Text('Quantity : ' +
                                  ' ' +
                                  value.cartItems[index][3].toString(), style: GoogleFonts.acme(
                                    textStyle: TextStyle(
                                        color: Colors.black),fontSize: 24)),
                                        Row(
                                          children: [
                   
                                          ],
                                        )
                            ],
                          ),
                          IconButton(
                              onPressed: (() =>
                                  Provider.of<CartModel>(context, listen: false)
                                      .removeItems(index)),
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.red,
                              )),
                              
                          ],
                        )
                        
                      
                      )
                    );
                  }),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total Price : ",
                        style: GoogleFonts.aleo(
                            textStyle: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 22.0)),
                      ),
                      Text(
                        '\$' + value.calculateTotal(),
                        style: GoogleFonts.aleo(
                            textStyle: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 22.0)),
                      )
                    ],
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: (() {
                  Navigator.of(context).pushNamed(routeManager.homePage);
                }),
                child: Text('Pay Now',
                    style: GoogleFonts.aleo(
                        textStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                            color: Colors.white))),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green, padding: EdgeInsets.all(22.0)),
              )
            ],
          );
        },
      ),
    ));
  }
}
