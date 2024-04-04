// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:google_fonts/google_fonts.dart';
import 'new_password.dart';

class Verification extends StatefulWidget {
  const Verification({super.key});

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {

  final defaultPinTheme = PinTheme(
    width: 56,
    height:60,
    textStyle: const TextStyle(fontSize: 22,color: Colors.black),
    decoration: BoxDecoration(
      color: Colors.yellow.shade100,
      borderRadius: BorderRadius.circular(8),
      border: Border.all(color: Colors.transparent)
    )
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/Group405.jpg"),
            Text("Check Your Mail and",style:GoogleFonts.dmSans(fontSize:22,fontWeight:FontWeight.w600)),
            Text("Enter Verification Code",style:GoogleFonts.dmSans(fontSize:22,fontWeight:FontWeight.w600)),
            const SizedBox(height: 10),
            Pinput(
              length: 4,
              defaultPinTheme: defaultPinTheme,
              focusedPinTheme: defaultPinTheme.copyWith(
                decoration: defaultPinTheme.decoration!.copyWith(
                  border: Border.all(color: const Color.fromRGBO(255, 204, 0, 1))
                )
              ),
              onCompleted: (pin) => debugPrint(pin),
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(280, 60),
                textStyle: const TextStyle(fontSize: 24),
                backgroundColor: const Color.fromRGBO(255, 204, 0, 1)
              ),
              onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> const New_pass()));},
              child: const Text("Send",style: TextStyle(color: Colors.black))
            ),
          ],
        ),
      ),
    );
  }
}