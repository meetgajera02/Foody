// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:foody/constants/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../app_provider.dart';
import '../models/product_model.dart';

// ignore: camel_case_types
class margherita extends StatefulWidget {
  final ProductModel singleProduct;
  const margherita({super.key, required this.singleProduct});
  @override
  State<margherita> createState() => _margheritaState();
}

// ignore: camel_case_types
class _margheritaState extends State<margherita> {
  
    var about = "Margherita pizza is a classic Italian dish consisting of a thin crust topped with tomato sauce, fresh mozzarella cheese, and basil leaves.";
  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(
      context,
    );
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 70,
            ),
            Row(
              children: [
                const Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                IconButton(
                  onPressed: ()=> Navigator.pop(context, false), 
                  icon: const Icon(Icons.arrow_back_ios,)
                ),
                const SizedBox(width: 220,),
                IconButton(
                  onPressed: (){
                    setState(() {
                      widget.singleProduct.isFavourite =
                        !widget.singleProduct.isFavourite;
                    });
                    if (widget.singleProduct.isFavourite) {
                      appProvider.addFavouriteProduct(widget.singleProduct);
                      showMessage("Added to Favourite");
                    } else {
                      appProvider.removeFavouriteProduct(widget.singleProduct);
                      showMessage("Remove to Favourite");
                    }
                  }, 
                  icon: Icon(widget.singleProduct.isFavourite? Icons.favorite : Icons.favorite_border,color: const Color.fromARGB(255, 255, 200, 58)),
                )
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset('assets/images/Ellipse11.png')
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(widget.singleProduct.name,style:GoogleFonts.lato(fontSize:26)),
                  const SizedBox(height: 20),
                  Text("Rs. ${widget.singleProduct.price}",style:GoogleFonts.josefinSans(fontSize:22,color:const Color.fromARGB(255, 178, 125, 0))),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Text("About",style:GoogleFonts.lato(fontSize:22)),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(widget.singleProduct.description, style: Theme.of(context).textTheme.bodyLarge,textAlign: TextAlign.justify),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Text("Choose Size",style:GoogleFonts.lato(fontSize:22)),
                    ],
                  ),
                  const SizedBox(height: 20),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: const Color.fromRGBO(252, 184, 44, 1)
                          ),
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                            child: Text("Regular (17.7 Cm)",style:GoogleFonts.lato(fontSize:22,color: Colors.white))
                          ),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: const Color.fromARGB(255, 220, 220, 220)
                          ),
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                            child: Text("Medium (24.5 Cm)",style:GoogleFonts.lato(fontSize:22))
                          ),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: const Color.fromARGB(255, 220, 220, 220)
                          ),
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                            child: Text("Large (33.3 Cm)",style:GoogleFonts.lato(fontSize:22))
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(00, 45),
                      backgroundColor: const Color.fromRGBO(255, 200, 58, 1),
                    ),
                    onPressed: (){
                      AppProvider appProvider = Provider.of<AppProvider>(context,listen: false);
                      appProvider.addCartProduct(widget.singleProduct);
                      showMessage("Added to Card");
                    }, 
                    child: SizedBox(
                      width: 150,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/images/Group.png"),
                          const Text("Add to cart",style: TextStyle(color: Colors.black),),
                          Image.asset("assets/images/Group1.png")
                        ],
                      ),
                    )
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}