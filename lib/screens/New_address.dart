// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: camel_case_types
class new_add extends StatefulWidget {
  const new_add({super.key});

  @override
  State<new_add> createState() => _new_addState();
}

// ignore: camel_case_types
class _new_addState extends State<new_add> {
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController building = TextEditingController();
  TextEditingController area = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Container(
                height: 50,
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: ()=> Navigator.pop(context, false), 
                    icon: const Icon(Icons.arrow_back_ios,)
                  ),
                  Text("Address",style:GoogleFonts.josefinSans(fontSize:22,color:const Color.fromARGB(255, 178, 125, 0))),
                ],
              ),
              const SizedBox(height: 20),
              // StreamBuilder <QuerySnapshot> (
              //   stream: FirebaseFirestore.instance.collection('Address').snapshots(),
              //   builder: (context, snapshot){
              //     List<Row> addressWidgets = [];
              //     if(snapshot.hasData){
              //       final Addresses = snapshot.data?.docs.reversed.toString();
              //       // ignore: non_constant_identifier_names
              //       for(var Address in Addresses){
              //         final addressWidget =  Row(
              //           children: [
              //             Text("${Address['name']}"),
              //             Text("${Address['phone']}"),
              //             Text("${Address['state']}"),
              //             Text("${Address['city']}"),
              //             Text("${Address['Building']}"),
              //             Text("${Address['Area']}")
              //           ],
              //         );
              //         addressWidgets.add(addressWidget);
              //       }
              //     }
              //     return Expanded(
              //       child: ListView(
              //         children: addressWidgets,
              //       ),
              //     );
              //   }
              // ),
              const SizedBox(height: 20),
              TextFormField(
                controller: name,
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
                      controller: state,
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
                onPressed: (){},
                child: const Text("Save",style: TextStyle(color: Colors.black))
              ),
            ],
          ),
        )
      ),
    );
  }
}