import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../app_provider.dart';
import '../constants/constants.dart';
import '../models/product_model.dart';

class SingleCartItem extends StatefulWidget {
  final ProductModel singleProduct;
  const SingleCartItem({super.key, required this.singleProduct});

  @override
  State<SingleCartItem> createState() => _SingleCartItemState();
}

class _SingleCartItemState extends State<SingleCartItem> {
  int qty = 1;
  // void initState() {
  //   qty = widget.singleProduct.qty ?? 1;
  //   setState(() {});
  //   super.initState();
  // }
  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(
      context,
    );
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  Row(
                  children: [
                    Container(
                      width: 300,
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
                          Image.asset("assets/images/Rectangle127.png",width: 66,height: 66),
                          const SizedBox(width: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 20),
                              Text(widget.singleProduct.name,style:GoogleFonts.josefinSans(fontSize:22)),
                              Text(widget.singleProduct.status,style:GoogleFonts.lato(fontSize:16,color:const Color.fromRGBO(126, 126, 126, 1))),
                              Row(
                                children: [
                                  Row(
                                    children: [
                                      CupertinoButton(
                                        onPressed: () {
                                          if (qty > 1) {
                                            setState(() {
                                              qty--;
                                            });
                                            appProvider.updateQty(widget.singleProduct, qty);
                                          }
                                        },
                                        padding: EdgeInsets.zero,
                                        child: const CircleAvatar(
                                          backgroundColor: Colors.amber,
                                          maxRadius: 13,
                                          child: Icon(Icons.remove),
                                        ),
                                      ),
                                      Text('$qty',style:GoogleFonts.lato(fontSize:18)),
                                      CupertinoButton(
                                        onPressed: () {
                                          setState(() {
                                            qty++;
                                          });
                                          appProvider.updateQty(widget.singleProduct, qty);
                                        },
                                        padding: EdgeInsets.zero,
                                        child: const CircleAvatar(
                                          backgroundColor: Colors.amber,
                                          maxRadius: 13,
                                          child: Icon(Icons.add),
                                        ),
                                      ),
                                    ]
                                  ),
                                  const SizedBox(width: 20),
                                  Text("₹ ${qty*widget.singleProduct.price}",style:GoogleFonts.lato(fontSize:16))
                                ],
                              )
                            ]
                          )
                        ],
                      ),
                    ),
                    CupertinoButton(
                      onPressed: () {
                        appProvider.removeCartProduct(widget.singleProduct);
                        showMessage("Removed from Cart");
                      }, 
                      child: const CircleAvatar(
                        backgroundColor: Colors.amber,
                        maxRadius: 13,
                        child: Icon(
                          Icons.delete,
                          size: 17,
                        ),
                      )
                    )
                  ]
                ),
              ],
            ),
          ),
        ],
      )
    );
  }
}