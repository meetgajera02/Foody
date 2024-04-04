import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foody/constants/constants.dart';
import 'verification.dart';
import 'sign_in.dart';
import 'sign_up.dart';

class Forget extends StatefulWidget {
  const Forget({super.key});

  @override
  State<Forget> createState() => _ForgetState();
}

class _ForgetState extends State<Forget> {
  TextEditingController email = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset("assets/images/Group404.jpg"),
            Center(
            child: SizedBox(
              width: 300,
              child: Column(
                children: [
                  TextFormField(
                    controller: email,
                    decoration: InputDecoration(
                      labelText: "Email",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)
                      )
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Back To"),
                      TextButton(
                        onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> const Sing_in()));},
                        child: const Text("Sign in",style: TextStyle(color:  Color.fromRGBO(225, 185, 17, 1)),)
                      ),
                    ]
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(280, 60), 
                      backgroundColor: const Color.fromRGBO(255, 204, 0, 1),
                      textStyle: const TextStyle(fontSize: 24)
                    ),
                    onPressed: (){
                      _auth.sendPasswordResetEmail(email: email.text.toString()).then((value){
                        showMessage("email are send");
                      }).onError((error, stackTrace) {
                        showMessage(error.toString());
                      });
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> const Verification()));
                    },
                    child: const Text("Send",style: TextStyle(color: Colors.black))
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don’t Have An Account?"),
                      TextButton(
                        onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> const sign_up()));},
                        child: const Text("Sign Up",style: TextStyle(color: Color.fromRGBO(225, 185, 17, 1)),)
                      )
                    ],
                  )
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