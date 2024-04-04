import 'package:flutter/material.dart';

// ignore: camel_case_types
class New_pass extends StatefulWidget {
  const New_pass({super.key});

  @override
  State<New_pass> createState() => _New_passState();
}

// ignore: camel_case_types
class _New_passState extends State<New_pass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset("assets/images/Group406.jpg"),
            Center(
            child: SizedBox(
              width: 300,
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "New Password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)
                      )
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Comfirm Password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)
                      )
                    ),
                  ),
                  const SizedBox(height: 50),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(280, 60),
                      textStyle: const TextStyle(fontSize: 24),
                      backgroundColor: const Color.fromRGBO(255, 204, 0, 1)
                    ),
                    onPressed: (){},
                    child: const Text("Update",style: TextStyle(color: Colors.black))
                  ),
                ],
              )
            ),
          ),
          ],
        ),
      ),
    );
  }
}