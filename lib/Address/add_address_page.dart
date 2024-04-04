// add_address_page.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'address_model.dart';
import 'address_service.dart';
import 'view_addresses_page.dart';

class AddAddressPage extends StatefulWidget {
  final AddressService addressService;

  const AddAddressPage({super.key, required this.addressService});

  @override
  // ignore: library_private_types_in_public_api
  _AddAddressPageState createState() => _AddAddressPageState();
}

class _AddAddressPageState extends State<AddAddressPage> {
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  final TextEditingController state = TextEditingController();
  final TextEditingController city = TextEditingController();
  TextEditingController building = TextEditingController();
  TextEditingController area = TextEditingController();
  TextEditingController pincode = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? _validateNonEmpty(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: ()=> Navigator.pop(context, false), 
          icon: const Icon(Icons.arrow_back_ios,)
        ),
        title:  Text("New Address",style:GoogleFonts.josefinSans(fontSize:22,color:const Color.fromARGB(255, 178, 125, 0))),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              TextFormField(
                controller: name,
                validator: _validateNonEmpty,
                decoration: InputDecoration(
                  labelText: "Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5)
                  )
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: phone,
                validator: _validateNonEmpty,
                decoration: InputDecoration(
                  labelText: "Phone number",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5)
                  )
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  SizedBox(
                    width: 155,
                    child: TextFormField(
                      controller: pincode,
                      validator: _validateNonEmpty,
                      decoration: InputDecoration(
                        labelText: "Pincode",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5)
                        )
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  // SizedBox(
                  //   width: 155,
                  //   child: TextFormField(
                  //     controller: city,
                  //     decoration: InputDecoration(
                  //       labelText: "City",
                  //       border: OutlineInputBorder(
                  //         borderRadius: BorderRadius.circular(5)
                  //       )
                  //     ),
                  //   ),
                  // ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  SizedBox(
                    width: 155,
                    child: TextFormField(
                      controller: state,
                      validator: _validateNonEmpty,
                      decoration: InputDecoration(
                        labelText: "State",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5)
                        )
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  SizedBox(
                    width: 155,
                    child: TextFormField(
                      controller: city,
                      validator: _validateNonEmpty,
                      decoration: InputDecoration(
                        labelText: "City",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5)
                        )
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: building,
                validator: _validateNonEmpty,
                decoration: InputDecoration(
                  labelText: "House No. Building Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5)
                  )
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: area,
                validator: _validateNonEmpty,
                decoration: InputDecoration(
                  labelText: "Road Name, Area, Colony",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5)
                  )
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(280, 60),
                  textStyle: const TextStyle(fontSize: 24),
                  backgroundColor: const Color.fromRGBO(255, 204, 0, 1)
                ),
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                  // Save the address
                  widget.addressService.addAddress(Address(
                    state: state.text,
                    name: name.text,
                    phone: phone.text,
                    city: city.text,
                    pinCode: pincode.text, 
                    area: area.text, 
                    building: building.text
                  ));
                  // Navigate to the view addresses page
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ViewAddressesPage(
                        addressService: widget.addressService,
                        onUpdate: (index, updatedAddress) {
                          // Handle update logic here (if needed)
                          // For example: widget.addressService.updateAddress(index, updatedAddress);
                        },
                      ),
                    ),
                  );
                  }
                },
                child: const Text("Save",style: TextStyle(color: Colors.black))
              ),
            ],
          ),
        ),
      ),),
    );
  }
}
