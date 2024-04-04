// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../app_provider.dart';
import '../widgets/single_favourite_item.dart';



class Wishlist extends StatefulWidget {
  const Wishlist({super.key});

  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
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
        title:  Text("Your Wishes",style:GoogleFonts.josefinSans(fontSize:22,color:const Color.fromARGB(255, 178, 125, 0))),
      ),
       body:  
      // SingleChildScrollView(
      //   child: Column(
      //     children: [
      //       Container(
      //         height: 70,
      //       ),
      //       const Padding(padding: EdgeInsets.symmetric(horizontal: 20)),
      //       Row(
      //         children: [
      //           const Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
      //           IconButton(
      //             onPressed: ()=> Navigator.pop(context, false), 
      //             icon: const Icon(Icons.arrow_back_ios,)
      //           ),
      //           Text("Your Wishes",style:GoogleFonts.josefinSans(fontSize:22,color:const Color.fromARGB(255, 178, 125, 0))),
      //         ],
      //       ),
            appProvider.getFavouriteProductList.isEmpty
          ? const Center(
              child: Text("Empty"),
            )
          : ListView.builder(
              itemCount: appProvider.getFavouriteProductList.length,
              padding: const EdgeInsets.all(12),
              itemBuilder: (ctx, index) {
                return SingleFavouriteItem(
                  singleProduct: appProvider.getFavouriteProductList[index],
                );
              }),
            // Container(
            //   margin: const EdgeInsets.symmetric(horizontal: 20),
            //   child: Column(
            //     children: [
            //       Row(
            //         children: [
            //           Container(
            //             width: 265,
            //             height:100,
            //             margin: const EdgeInsets.symmetric(horizontal: 3,vertical: 20),
            //             decoration: BoxDecoration(
            //               borderRadius: BorderRadius.circular(5),
            //               boxShadow: const [BoxShadow(
            //                 color: Color.fromARGB(255, 243, 243, 243),
            //               )]
            //             ),
            //             child: Row(
            //               children: [
            //                 const Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
            //                 Image.asset("assets/images/Rectangle42.png",width: 66,height: 66),
            //                 const SizedBox(width: 20),
            //                 Column(
            //                   crossAxisAlignment: CrossAxisAlignment.start,
            //                   children: [
            //                     const SizedBox(height: 20),
            //                     Text("Margherita",style:GoogleFonts.josefinSans(fontSize:22)),
            //                     Text("₹ 120.00",style:GoogleFonts.lato(fontSize:18)),
            //                   ]
            //                 )
            //               ],
            //             ),
            //           ),
            //           IconButton(
            //             onPressed: (){}, 
            //             icon: const FaIcon(FontAwesomeIcons.heart)
            //           )
            //         ]
            //       ),
            //       Row(
            //         children: [
            //           Container(
            //             width: 265,
            //             height:100,
            //             margin: const EdgeInsets.symmetric(horizontal: 3,vertical: 20),
            //             decoration: BoxDecoration(
            //               borderRadius: BorderRadius.circular(5),
            //               boxShadow: const [BoxShadow(
            //                 color: Color.fromARGB(255, 243, 243, 243),
            //               )]
            //             ),
            //             child: Row(
            //               children: [
            //                 const Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
            //                 Image.asset("assets/images/Rectangle127.png",width: 66,height: 66),
            //                 const SizedBox(width: 20),
            //                 Column(
            //                   crossAxisAlignment: CrossAxisAlignment.start,
            //                   children: [
            //                     const SizedBox(height: 20),
            //                     Text("Veggie burger",style:GoogleFonts.josefinSans(fontSize:22)),
            //                     Text("₹ 130.00",style:GoogleFonts.lato(fontSize:18)),
            //                   ]
            //                 )
            //               ],
            //             ),
            //           ),
            //           IconButton(
            //             onPressed: (){}, 
            //             icon: const FaIcon(FontAwesomeIcons.heart)
            //           )
            //         ]
            //       ),
            //       Row(
            //         children: [
            //           Container(
            //             width: 265,
            //             height:100,
            //             margin: const EdgeInsets.symmetric(horizontal: 3,vertical: 20),
            //             decoration: BoxDecoration(
            //               borderRadius: BorderRadius.circular(5),
            //               boxShadow: const [BoxShadow(
            //                 color: Color.fromARGB(255, 243, 243, 243),
            //               )]
            //             ),
            //             child: Row(
            //               children: [
            //                 const Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
            //                 Image.asset("assets/images/Rectangle129.png",width: 66,height: 66),
            //                 const SizedBox(width: 20),
            //                 Column(
            //                   crossAxisAlignment: CrossAxisAlignment.start,
            //                   children: [
            //                     const SizedBox(height: 20),
            //                     Text("Peri Sandwich",style:GoogleFonts.josefinSans(fontSize:20)),
            //                     Text("₹ 150.00",style:GoogleFonts.lato(fontSize:18)),
            //                   ]
            //                 )
            //               ],
            //             ),
            //           ),
            //           IconButton(
            //             onPressed: (){}, 
            //             icon: const FaIcon(FontAwesomeIcons.heart)
            //           )
            //         ]
            //       ),
            //       Row(
            //         children: [
            //           Container(
            //             width: 265,
            //             height:100,
            //             margin: const EdgeInsets.symmetric(horizontal: 3,vertical: 20),
            //             decoration: BoxDecoration(
            //               borderRadius: BorderRadius.circular(5),
            //               boxShadow: const [BoxShadow(
            //                 color: Color.fromARGB(255, 243, 243, 243),
            //               )]
            //             ),
            //             child: Row(
            //               children: [
            //                 const Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
            //                 Image.asset("assets/images/Rectangle131.png",width: 66,height: 66),
            //                 const SizedBox(width: 20),
            //                 Column(
            //                   crossAxisAlignment: CrossAxisAlignment.start,
            //                   children: [
            //                     const SizedBox(height: 20),
            //                     Text("Corona beer",style:GoogleFonts.josefinSans(fontSize:22)),
            //                     Text("₹ 110.00",style:GoogleFonts.lato(fontSize:18)),
            //                   ]
            //                 )
            //               ],
            //             ),
            //           ),
            //           IconButton(
            //             onPressed: (){}, 
            //             icon: const FaIcon(FontAwesomeIcons.heart)
            //           )
            //         ]
            //       ),
            //     ],
            //   ),
            // )
         // ],
        //),
      //),
    );
  }
}