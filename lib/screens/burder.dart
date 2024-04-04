import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/routes.dart';
import '../firebase_services/firebase_firestore.dart';
import '../models/product_model.dart';
import 'Margherita.dart';
import 'card.dart';

class Burger extends StatefulWidget {
  const Burger({super.key});

  @override
  State<Burger> createState() => _BurgerState();
}

class _BurgerState extends State<Burger> {
  List<ProductModel> productModelList = [];
  bool isLoading = false;
  @override
  void initState() {
    getCategoryList();
    super.initState();
  }

  void getCategoryList() async {
    setState(() {
      isLoading = true;
    });
    productModelList = await FirebaseFirestoreHelper.instance.burger();
    //productModelList.shuffle();
    setState(() {
      isLoading = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading? Center(
        child: Container(
          height: 100,
          width: 100,
          alignment: Alignment.center,
          child: const CircularProgressIndicator(),
        ),
      ) :SingleChildScrollView(
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
                Text("Burger",style:GoogleFonts.josefinSans(fontSize:22,color:const Color.fromARGB(255, 178, 125, 0))),
                const Spacer(),
                IconButton(
                  onPressed: (){Routes.instance.push(widget: const Cart(), context: context);}, 
                  icon: const Icon(Icons.shopping_cart)
                )
              ],
            ),
            productModelList.isEmpty ? const Center(
              child: Text("Best Product is empty"),
            )
            :GridView.builder(
              shrinkWrap: true,
              itemCount: productModelList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1), 
              itemBuilder: (ctx,index) {
                ProductModel singleProduct = productModelList[index];
                return CupertinoButton(
                  onPressed: (){Routes.instance.push(widget: margherita(singleProduct: singleProduct),context: context);},
                  child: SizedBox(
                    child: Column(
                      children: [
                        const Padding(padding: EdgeInsets.symmetric(horizontal: 20)),
                        Row(
                          children: [
                            Container(width: 20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset("assets/images/veg-icon.png",width: 10,height: 10),
                                Text(singleProduct.name,style:GoogleFonts.lato(fontSize:22,color: Colors.black)),
                                Text(singleProduct.status,style:GoogleFonts.lato(fontSize:14,color:const Color.fromRGBO(126, 126, 126, 1))),
                                Text("₹ ${singleProduct.price}",style:GoogleFonts.lato(fontSize:20,color: Colors.black)),
                              ],
                            ),
                            const Spacer(),
                            Row(
                             mainAxisAlignment: MainAxisAlignment.end,
                              children: [Image.network(singleProduct.image,width: 123,height: 123)]
                            ),
                          ],
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(00, 45),
                            backgroundColor: const Color.fromRGBO(255, 200, 58, 1),
                          ),
                          onPressed: (){}, 
                          child: SizedBox(
                            width: 150,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset("assets/images/Group.png"),
                                const Text("Add to cart"),
                                Image.asset("assets/images/Group1.png")
                              ],
                            ),
                          )
                        )
                      ],
                    ),
                  ),
                );
              }
            )
          ],
        ),
      ),
    );
  }
}