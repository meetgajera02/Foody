import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Debit extends StatefulWidget {
  const Debit({super.key});

  @override
  State<Debit> createState() => _DebitState();
}

class _DebitState extends State<Debit> {
    String selectedCountry = 'India';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: ()=> Navigator.pop(context, false), 
          icon: const Icon(Icons.arrow_back_ios,)
        ),
        title:  Text("Debit Card",style:GoogleFonts.josefinSans(fontSize:22,color:const Color.fromARGB(255, 178, 125, 0))),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Padding(padding: EdgeInsets.all(10)),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Cardholder Name",labelStyle:GoogleFonts.dmSans(fontSize:18,color:const Color.fromARGB(103, 103, 103, 100)),
                  prefixIcon: const Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5)
                  )
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Card Number",labelStyle:GoogleFonts.dmSans(fontSize:18,color:const Color.fromARGB(103, 103, 103, 100)),
                  prefixIcon: const Icon(Icons.card_giftcard),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5)
                  )
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  SizedBox(
                    width: 160,
                    height: 50,
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: "MM / YY",labelStyle:GoogleFonts.dmSans(fontSize:18,color:const Color.fromARGB(103, 103, 103, 100)),
                        prefixIcon: const Icon(Icons.calendar_month),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5)
                        )
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  SizedBox(
                    width: 155,
                    height: 50,
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: "CVC",labelStyle:GoogleFonts.dmSans(fontSize:18,color:const Color.fromARGB(103, 103, 103, 100)),
                        prefixIcon: const Icon(Icons.card_travel),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5)  
                        )
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.black,
                  )
                ),
                child:  Row(
                  children: [
                    const SizedBox(width: 10),
                    const Icon(Icons.language),
                    const SizedBox(width: 10),
                    DropdownButton<String>(
                value: selectedCountry,
                onChanged: (value) {
                  setState(() {
                    selectedCountry = value!;
                  });
                },
                items: ['India', 'United States', 'United Kingdom']
                    .map((country) => DropdownMenuItem<String>(
                          value: country,
                          child:
                          Text(country),
                        ))
                    .toList(),
              ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(280, 60),
                  textStyle: const TextStyle(fontSize: 24),
                  backgroundColor: const Color.fromRGBO(255, 204, 0, 1)
                ),
                onPressed: () {},
                child: const Text("Confirm",style: TextStyle(color: Colors.black))
              ),
            ],
          ),
        ),
      ),
    );
  }
}