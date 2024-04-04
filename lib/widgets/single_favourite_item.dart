import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../app_provider.dart';
import '../constants/constants.dart';
import '../models/product_model.dart';

class SingleFavouriteItem extends StatefulWidget {
  final ProductModel singleProduct;
  const SingleFavouriteItem({super.key, required this.singleProduct});

  @override
  State<SingleFavouriteItem> createState() => _SingleFavouriteItemState();
}

class _SingleFavouriteItemState extends State<SingleFavouriteItem> {
  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(
      context,
    );
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 262,
                        height:100,
                        margin: const EdgeInsets.symmetric(horizontal: 3,vertical: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: const [BoxShadow(
                            color: Color.fromARGB(255, 243, 243, 243),
                          )]
                        ),
                        child: Row(
                          children: [
                            const Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                            Image.asset("assets/images/Rectangle42.png",width: 66,height: 66),
                            const SizedBox(width: 20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 20),
                                Text(widget.singleProduct.name,style:GoogleFonts.josefinSans(fontSize:22)),
                                Text("₹  ${widget.singleProduct.price}",style:GoogleFonts.lato(fontSize:18)),
                              ]
                            )
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: (){
                          setState(() {
                            widget.singleProduct.isFavourite = !widget.singleProduct.isFavourite;
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
                    ]
                  ),
                ],
              ),
            )
        ],
      )
    );
  }
}
