import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shopper/components/cart_items.dart';
import 'package:shopper/components/cart_model.dart';
import 'package:shopper/components/display_all.dart';
import 'package:shopper/components/product.dart';

class hometwo extends StatefulWidget {
  const hometwo({super.key});

  @override
  State<hometwo> createState() => _hometwoState();
}

class _hometwoState extends State<hometwo> {
  int pageClicked = 0;
  final pages = const [
   product(),
   display_all(),
    cart(),
    
  ];
   bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 600;
  bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width <= 600;
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[pageClicked],
      bottomNavigationBar:  Consumer<CartModel>(
        builder: (context, value, child) {
          return Stack(
           children: [
          SizedBox(
            
            height: 78,
            child:  BottomNavigationBar(
              selectedLabelStyle: GoogleFonts.montserrat(),
              unselectedLabelStyle: GoogleFonts.montserrat(),
              currentIndex: pageClicked,
              unselectedItemColor: Color.fromARGB(255, 201, 201, 201),
              elevation: 20,
              iconSize: 22,
              type: BottomNavigationBarType.fixed,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home',),
                  BottomNavigationBarItem(icon: Icon(Icons.store), label: 'Store',),
                 BottomNavigationBarItem(
                    icon: Icon(Icons.shopping_cart), label: 'Cart'),
                
              ],
              onTap: (index) {
                setState(() {
                  pageClicked = index;
                });
              },
            ),
          ),
          Positioned(
            
            right: isDesktop(context)? 110 : 70,
            top: 10,
            child:  Container(
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(50)
            ),
            child: Center(child: Text('${value.cartItems.length}',style: TextStyle(color: Colors.white),)),),height: 20,width: 20,)
           ],
          
      
      
         
        );
        },
       
      )
    );
  }
}
