import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foody/screens/single_card.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../Address/address_service.dart';
import '../Address/view_addresses_page.dart';
import '../app_provider.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final AddressService _addressService = AddressService();

  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(
      context,
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: ()=> Navigator.pop(context, false), 
          icon: const Icon(Icons.arrow_back_ios,)
        ),
        title:  Text("Your Card",style:GoogleFonts.josefinSans(fontSize:22,color:const Color.fromARGB(255, 178, 125, 0))),
      ),
      body: appProvider.getCartProductList.isEmpty
        ? const Center( 
          child: Text("Empty"),
        )
        : ListView.builder(
          itemCount: appProvider.getCartProductList.length,
          padding: const EdgeInsets.all(12),
          itemBuilder: (ctx, index) {
            return SingleCartItem(
              singleProduct: appProvider.getCartProductList[index],
          );
        }
      ), 
      bottomNavigationBar: SizedBox(
        height: 130,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Total",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "₹ ${appProvider.totalPrice().toString()}",
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 24.0,
              ),
              CupertinoButton(
                color: const Color.fromRGBO(255, 204, 0, 1),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> ViewAddressesPage(addressService: _addressService,)));
                  //appProvider.clearBuyProduct();
                  //appProvider.addBuyProductCartList();
                  // appProvider.clearCart();
                  // if (appProvider.getBuyProductList.isEmpty) {
                  //   showMessage("Cart is empty");
                  // } else {
                  //   Routes.instance.push(
                  //       widget: const CartItemCheckout(), context: context);
                  // }
                }, child: const Text("Confirm",style: TextStyle(color: Colors.black)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}