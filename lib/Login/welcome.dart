import 'package:flutter/material.dart';
import 'sign_in.dart';
import 'sign_up.dart';

// ignore: camel_case_types
class welcome extends StatefulWidget {
  const welcome({super.key});

  @override
  State<welcome> createState() => _welcomeState();
}

// ignore: camel_case_types
class _welcomeState extends State<welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Image.asset("assets/images/Group402.jpg"),
              const SizedBox(height: 2),
              Image.asset("assets/images/logo.png",width: 226,height: 226),
              const SizedBox(height: 50),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(320, 60),
                  textStyle: const TextStyle(fontSize: 24),
                  backgroundColor: const Color.fromRGBO(255, 204, 0, 1)
                ),
                onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> const Sing_in()));},
                child: const Text("Sign In",style: TextStyle(color: Colors.black))
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(320, 60),
                  textStyle: const TextStyle(fontSize: 24),
                  backgroundColor: const Color.fromRGBO(255, 204, 0, 1)
                ),
                onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> const sign_up()));},
                child: const Text("Sign Up",style: TextStyle(color: Colors.black))
              ),
            ],
          ),
        ),
      ),
    );
  }
}