// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:intl/intl.dart';

class Order extends StatefulWidget {
  const Order({super.key});

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  DateTime time = DateTime.now();
  final Uri url = Uri(scheme:'tel',path: "9537230057");
  callnumber() async{
    await launchUrl(url);
  }
  @override
  Widget build(BuildContext context) {
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
                Text("Order",style:GoogleFonts.josefinSans(fontSize:22,color:const Color.fromARGB(255, 178, 125, 0))),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal:20,vertical:10),
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Row(
                children: [
                  // appProvider.getUserInformation.image == null
                  //   ? const Icon(
                  //       Icons.person_outline,
                  //       size: 120,
                  //     )
                  //   : CircleAvatar(
                  //       backgroundImage:
                  //           NetworkImage(appProvider.getUserInformation.image!),
                  //       radius: 60,
                  //     ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset('assets/images/logo.png',width: 50,height: 50)
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Foody World",style:GoogleFonts.lumanosimo(fontSize:26)),
                      Text("Nariman Point, Mumbai",style:GoogleFonts.dmSans(fontSize:18,color:const Color.fromARGB(125, 87, 87, 85))),
                    ],
                  ),
                  const Spacer(),
                  CupertinoButton(
                    onPressed: callnumber,
                    padding: EdgeInsets.zero,
                    child:   Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.amber
                        ),
                        borderRadius: BorderRadius.circular(100)
                      ),
                      child: const Icon(Icons.phone,color: Colors.amber,),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              margin:const EdgeInsets.symmetric(horizontal:10),
              padding: const EdgeInsets.symmetric(horizontal:15,vertical:10),
              decoration:  BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [BoxShadow(
                  color: Colors.black,
                  blurRadius: 1.0,
                ),],
                color: Colors.white,
              ),
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset('assets/images/logo.png',width: 50,height: 50)
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Order ID #11699770",style:GoogleFonts.dmSans(fontSize:20)),
                          Text("Home",style:GoogleFonts.dmSans(fontSize:17,fontWeight: FontWeight.bold,color:const Color.fromARGB(255, 108, 108, 108))),
                          Text("48 Souterhead Road,\nBungalow no.3 P",style:GoogleFonts.dmSans(fontSize:17,color:const Color.fromARGB(255, 108, 108, 108))),
                        ],
                      ),
                      const Spacer(),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset('assets/images/Group468.png',width: 36,height: 36)
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Text(DateFormat('yMMMMd').format(time),style:GoogleFonts.mada(fontSize:17,color:const Color.fromARGB(255, 108, 108, 108))),
                      //Text("10-Jan-2024  |  06:45:06 PM",style:GoogleFonts.mada(fontSize:17,color:const Color.fromARGB(255, 108, 108, 108))),
                      const Spacer(),
                      Text("367.55 Rs.",style:GoogleFonts.mada(fontSize:17)),
                    ],
                  ),
                  Row(
                    children: [
                      Text("Order Type",style:GoogleFonts.mada(fontSize:17,color:const Color.fromARGB(255, 108, 108, 108))),
                      const Spacer(),
                      Text("Pending...",style:GoogleFonts.mada(fontSize:17)),
                    ],
                  ),
                  CupertinoButton(
                    onPressed: (){}, 
                    child: Text("View Order",style:GoogleFonts.dmSans(fontSize:18,color:const Color.fromARGB(255, 178, 125, 0))),
                  )
                ]
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}