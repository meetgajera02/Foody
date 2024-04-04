// edit_address_page.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'address_model.dart';
import 'address_service.dart';

class EditAddressPage extends StatefulWidget {
  final AddressService addressService;
  final int index;
  final Function(int, Address)? onUpdate;

  const EditAddressPage({super.key, required this.addressService, required this.index, this.onUpdate});

  @override
  // ignore: library_private_types_in_public_api
  _EditAddressPageState createState() => _EditAddressPageState();
}

class _EditAddressPageState extends State<EditAddressPage> {
  late TextEditingController name;
  late TextEditingController phone;
  late TextEditingController state;
  late TextEditingController city;
  late TextEditingController building;
  late TextEditingController area;
  late TextEditingController pincode;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? _validateNonEmpty(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    return null;
  }

  @override
  void initState() {
    super.initState();
    Address address = widget.addressService.addresses[widget.index];
    name = TextEditingController(text: address.name);
    phone = TextEditingController(text: address.phone);
    state = TextEditingController(text: address.state);
    city = TextEditingController(text: address.city);
    pincode = TextEditingController(text: address.pinCode);
    building = TextEditingController(text: address.building);
    area = TextEditingController(text: address.area);
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
        title:  Text("Edit Address",style:GoogleFonts.josefinSans(fontSize:22,color:const Color.fromARGB(255, 178, 125, 0))),
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
                validator: _validateNonEmpty,
                controller: building,
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
              const SizedBox(height: 20.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(280, 60),
                  textStyle: const TextStyle(fontSize: 24),
                  backgroundColor: const Color.fromRGBO(255, 204, 0, 1)
                ),
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                  // Update the address
                  widget.addressService.updateAddress(
                    widget.index,
                    Address(
                      name: name.text,
                      phone: phone.text,
                      city: city.text,
                      state: state.text,
                      pinCode: pincode.text, 
                      area: area.text, 
                      building: building.text,
                    ),
                  );
      
                  // Notify the onUpdate callback (if provided)
                  if (widget.onUpdate != null) {
                    widget.onUpdate!(widget.index, widget.addressService.addresses[widget.index]);
                  }
      
                  // Go back to the view addresses page
                  Navigator.pop(context);
                  }
                },
                child: const Text("Update Address",style: TextStyle(color: Colors.black))
              ),
            ],
          ),
        ),
      ),),
    );
  }
}
