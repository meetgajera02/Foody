import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foody/screens/credit_card.dart';
import 'package:foody/screens/debit_card.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Address/address_model.dart';
import '../Address/address_service.dart';
import '../Address/view_addresses_page.dart';

class Payment extends StatefulWidget {
  final Address address;
  const Payment({super.key,required this.address});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  late final Address address;
  final AddressService _addressService = AddressService();

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: ()=> Navigator.pop(context, false), 
          icon: const Icon(Icons.arrow_back_ios,)
        ),
        title:  Text("Payment",style:GoogleFonts.josefinSans(fontSize:22,color:const Color.fromARGB(255, 178, 125, 0))),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.address.name,style:GoogleFonts.dmSans(fontSize:20,fontWeight: FontWeight.bold,color: Colors.black)),
                      Text(widget.address.building,style:GoogleFonts.dmSans(fontSize:18,color: Colors.black)),
                      Text(widget.address.area,style:GoogleFonts.dmSans(fontSize:18,color: Colors.black)),
                      Title(
                        color: Colors.black,
                        child: Text("${widget.address.city}, ${widget.address.state} - ${widget.address.pinCode}",style:GoogleFonts.dmSans(fontSize:18,color: Colors.black)),
                      ),
                      const SizedBox(height: 1),
                      Text(widget.address.phone,style:GoogleFonts.dmSans(fontSize:18,color: Colors.black))
                    ]
                  ),
                  const Spacer(),
                  CupertinoButton(
                    onPressed: () { Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>  ViewAddressesPage(addressService: _addressService,),
                      ),
                    ); },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: Colors.amber
                        )
                      ),
                      child: const Text("Change",style: TextStyle(color: Colors.amber)),
                    ),
                  )
                ],
              ),
            ),
            // Row(
            //   children: [
            //     Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         Text(address.name,style:GoogleFonts.dmSans(fontSize:20,fontWeight: FontWeight.bold,color: Colors.black)),
            //         Text(address.building,style:GoogleFonts.dmSans(fontSize:18,color: Colors.black)),
            //         Text(address.area,style:GoogleFonts.dmSans(fontSize:18,color: Colors.black)),
            //         Title(
            //           color: Colors.black,
            //           child: Text("${address.city}, ${address.state} - ${address.pinCode}",style:GoogleFonts.dmSans(fontSize:18,color: Colors.black)),
            //         ),
            //         const SizedBox(height: 1),
            //         Text(widget.address.phone)
            //       ]
            //     ),
            //     const Spacer(),
            //     CupertinoButton(
            //       onPressed: () { Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //           builder: (context) =>  ViewAddressesPage(addressService: _addressService,),
            //         ),
            //       ); },
            //       child: Container(
            //         padding: const EdgeInsets.all(8),
            //         decoration: BoxDecoration(
            //           borderRadius: BorderRadius.circular(5),
            //           border: Border.all(
            //             color: Colors.amber
            //           )
            //         ),
            //         child: const Text("Change",style: TextStyle(color: Colors.amber)),
            //       ),
            //     )
            //   ],
            // ),
            Container(
              margin: const EdgeInsets.all(20),
              child: Text("Payment Method",style:GoogleFonts.dmSans(fontSize:25,fontWeight: FontWeight.bold))
            ),
            const SizedBox(height: 10),
            Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: Colors.black,
                  style: BorderStyle.solid
                )
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("UPI",style:GoogleFonts.dmSans(fontSize:25,fontWeight: FontWeight.bold)),
                  Container(
                    margin:  const EdgeInsets.fromLTRB(0, 0, 0, 11),
                    width:  double.infinity,
                    height:  1,
                    decoration:  const BoxDecoration (
                      color:  Color(0x7f000000),
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        CupertinoButton(
                          onPressed: (){},
                          child: Container(
                            width: 50,
                            height:50,
                            decoration: BoxDecoration(
                              borderRadius:  BorderRadius.circular(10),
                              border: Border.all(color: Colors.black)
                            ),
                            child:Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset("assets/images/google_pay.jpg",width:40)
                                ],
                              ),
                            )
                          ),
                        ),
                        CupertinoButton(
                          onPressed: (){},
                          child: Container(
                            width: 50,
                            height:50,
                            decoration: BoxDecoration(
                              borderRadius:  BorderRadius.circular(10),
                              border: Border.all(color: Colors.black)
                            ),
                            child:Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset("assets/images/phone_pay.png",width: 40,)
                                ],
                              ),
                            )
                          ),
                        ),
                        CupertinoButton(
                          onPressed: (){},
                          child: Container(
                            width: 50,
                            height:50,
                            decoration: BoxDecoration(
                              borderRadius:  BorderRadius.circular(10),
                              border: Border.all(color: Colors.black)
                            ),
                            child:Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset("assets/images/Paytm_Logo.png")
                                ],
                              ),
                            )
                          ),
                        ),
                        
                        CupertinoButton(
                          onPressed: (){},
                          child: Container(
                            width: 50,
                            height:50,
                            decoration: BoxDecoration(
                              borderRadius:  BorderRadius.circular(10),
                              border: Border.all(color: Colors.black)
                            ),
                            child:Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset("assets/images/amazon_pay.png")
                                ],
                              ),
                            )
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: Colors.black,
                  style: BorderStyle.solid
                )
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Debit Card",style:GoogleFonts.dmSans(fontSize:25,fontWeight: FontWeight.bold)),
                  Container(
                    margin:  const EdgeInsets.fromLTRB(0, 0, 0, 11),
                    width:  double.infinity,
                    height:  1,
                    decoration:  const BoxDecoration (
                      color:  Color(0x7f000000),
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        CupertinoButton(
                          onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> const Debit()));},
                          child: Container(
                            width: 50,
                            height:50,
                            decoration: BoxDecoration(
                              borderRadius:  BorderRadius.circular(10),
                              border: Border.all(color: Colors.black)
                            ),
                            child:const Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.add,size: 30,color: Colors.black,)
                                  //Image.asset("assets/images/google_pay.jpg",width:40)
                                ],
                              ),
                            )
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Add new debit card",style:GoogleFonts.dmSans(fontSize:22)),
                            Text("Save and pay via cards",style:GoogleFonts.dmSans(fontSize:14)),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: Colors.black,
                  style: BorderStyle.solid
                )
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Cradit Card",style:GoogleFonts.dmSans(fontSize:25,fontWeight: FontWeight.bold)),
                  Container(
                    margin:  const EdgeInsets.fromLTRB(0, 0, 0, 11),
                    width:  double.infinity,
                    height:  1,
                    decoration:  const BoxDecoration (
                      color:  Color(0x7f000000),
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        CupertinoButton(
                          onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> const Credit()));},
                          child: Container(
                            width: 50,
                            height:50,
                            decoration: BoxDecoration(
                              borderRadius:  BorderRadius.circular(10),
                              border: Border.all(color: Colors.black)
                            ),
                            child:const Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.add,size: 30,color: Colors.black,)
                                  //Image.asset("assets/images/google_pay.jpg",width:40)
                                ],
                              ),
                            )
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Add new cradit card",style:GoogleFonts.dmSans(fontSize:22)),
                            Text("Save and pay via cards",style:GoogleFonts.dmSans(fontSize:14)),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}