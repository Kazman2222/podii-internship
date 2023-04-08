import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopper/routes/routes.dart';

class home extends StatelessWidget {
  const home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
        body: Container(
          decoration: const BoxDecoration(color: Colors.white),
          child: Center(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: const Image(
                          image: NetworkImage(
                              'https://media.istockphoto.com/id/1368585997/vector/flat-vector-illustration-of-group-of-people-shopping-isolated-on-white-background.jpg?s=612x612&w=0&k=20&c=e1nvU7wCGdFSq8mS5HLccOnwpkwTHgEHmd4RPUDgIeo='),
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      Container(
                        child: Column(
                          children: [
                             Text(
                              'Welcome To Jevelin Store',
                              style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                  letterSpacing: 2.0,
                                  fontFamily: 'AlegreyaSans')
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              height: 45.0,
                            ),
                            Center(
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context)
                                        .pushNamed(routeManager.shoppingPage);
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 70,vertical: 20,
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border.all(width: 1, color: Colors.orange),
                                    borderRadius: BorderRadius.circular(5)
                                  ),
                                  child:  Text(
                                      'Shop Now',
                                      style: GoogleFonts.montserrat(textStyle: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black), ) 
                                    ),
                                ),
                              ),
                            )
                         
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
