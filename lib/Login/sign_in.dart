import 'package:flutter/material.dart';
import '../constants/constants.dart';
import '../constants/routes.dart';
import '../firebase_services/firebase_auth.dart';
import '../screens/home.dart';
import 'forget_password.dart';
import 'sign_up.dart';

// ignore: camel_case_types
class Sing_in extends StatefulWidget {
  const Sing_in({super.key});

  @override
  State<Sing_in> createState() => _Sing_inState();
}

// ignore: camel_case_types
class _Sing_inState extends State<Sing_in> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isShowPassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children:[
            Image.asset("assets/images/Group400.jpg"),
           Center(
            child: SizedBox(
              width: 300,
              child: Column(
                children: [
                  TextFormField(
                    controller: email,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: "Email",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)
                      )
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: password,
                    obscureText: isShowPassword,
                    decoration: InputDecoration(
                      labelText: "Password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)
                      ),
                      suffixIcon: IconButton(
                        icon : isShowPassword? const Icon(Icons.visibility): const Icon(Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            isShowPassword = !isShowPassword;
                          });
                        },
                        padding: EdgeInsets.zero,
                      )
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> const Forget()));},
                        child: const Text("Forget Password?")
                      ),
                    ]
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(280, 60),
                      textStyle: const TextStyle(fontSize: 24),
                      backgroundColor: const Color.fromRGBO(255, 204, 0, 1)
                    ),
                    onPressed: () async{
                      bool isVaildated = loginVaildation(email.text, password.text);
                      if (isVaildated) {
                        bool isLogined = await FirebaseAuthHelper.instance
                          .login(email.text, password.text, context);
                        if (isLogined) {
                          // ignore: use_build_context_synchronously
                          Routes.instance.pushAndRemoveUntil(
                            widget: const Home(), context: context);
                        }
                      }
                    },
                    child: const Text("Sign In",style: TextStyle(color: Colors.black))
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don’t Have An Account?"),
                      TextButton(
                        onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> const sign_up()));},
                        child: const Text("Sign Up",style: TextStyle(color:  Color.fromRGBO(225, 185, 17, 1)),)
                      )
                    ],
                  )
                ],
              )
            ),
          ),
          ]
        ),
      ),
    );
  }
}