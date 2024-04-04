// view_addresses_page.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../screens/payment.dart';
import 'package:google_fonts/google_fonts.dart';
import 'add_address_page.dart';
import 'address_model.dart';
import 'address_service.dart';
import 'edit_address_page.dart';

class ViewAddressesPage extends StatelessWidget {
  final AddressService addressService;
  final Function(int, Address)? onUpdate;

  const ViewAddressesPage({super.key, required this.addressService, this.onUpdate});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: ()=> Navigator.pop(context, false), 
          icon: const Icon(Icons.arrow_back_ios,)
        ),
        title:  Text("Address",style:GoogleFonts.josefinSans(fontSize:22,color:const Color.fromARGB(255, 178, 125, 0))),
      ),
      body: ListView.builder(
        itemCount: addressService.addresses.length,
        itemBuilder: (context, index) {
          Address address = addressService.addresses[index];
          return CupertinoButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> Payment(address: address)));
            },
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(address.name,style:GoogleFonts.dmSans(fontSize:20,fontWeight: FontWeight.bold,color: Colors.black)),
                    Text(address.building,style:GoogleFonts.dmSans(fontSize:18,color: Colors.black)),
                    Text(address.area,style:GoogleFonts.dmSans(fontSize:18,color: Colors.black)),
                    Title(
                      color: Colors.black,
                      child: Text("${address.city}, ${address.state} - ${address.pinCode}",style:GoogleFonts.dmSans(fontSize:18,color: Colors.black)),
                    ),
                    const SizedBox(height: 1),
                    Text(address.phone,style:GoogleFonts.dmSans(fontSize:18,color: Colors.black))
                  ]
                ),
                const Spacer(),
                CupertinoButton(
                  onPressed: () { Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditAddressPage(
                        addressService: addressService,
                        index: index,
                        onUpdate: onUpdate,
                      ),
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
          );
          // ListTile(
          //   title: Text('${address.name},\n${address.phone},${address.state}, ${address.city}, ${address.building} ${address.pinCode}'),
            
          //   onTap: () {
          //     // Navigate to the edit address page
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //         builder: (context) => EditAddressPage(
          //           addressService: addressService,
          //           index: index,
          //           onUpdate: onUpdate,
          //         ),
          //       ),
          //     );
          //   },
          // );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.white,
        label: const Text('Add New Address',style: TextStyle(color: Color.fromARGB(255, 178, 125, 0))),
        onPressed: () {
          // Navigate to the add address page
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddAddressPage(addressService: addressService),
            ),
          );
        },
        icon: const Icon(Icons.add, color: Color.fromARGB(255, 178, 125, 0), size: 25),
      ),
    );
  }
}
