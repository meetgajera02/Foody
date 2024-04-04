import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/constants.dart';
import '../firebase_services/firebase_auth.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  bool isShowPassword = true;
  TextEditingController newpassword = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Container(
              height: 70,
            ),
            Row(
              children: [
                IconButton(
                  onPressed: ()=> Navigator.pop(context, false), 
                  icon: const Icon(Icons.arrow_back_ios,)
                ),
                Text("New Password",style:GoogleFonts.josefinSans(fontSize:22,color:const Color.fromARGB(255, 178, 125, 0))),
              ],
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: newpassword,
              obscureText: isShowPassword,
              decoration: InputDecoration(
                hintText: "New Password",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5)
                ),
                prefixIcon: const Icon(
                  Icons.key,
                ),
                suffixIcon: IconButton(
                  icon : isShowPassword? const Icon(Icons.visibility): const Icon(Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      isShowPassword = !isShowPassword;
                    });
                  },
                  padding: EdgeInsets.zero,
                ),
              ),
            ),
            const SizedBox(
              height: 24.0,
            ),
            TextFormField(
              controller: confirmpassword,
              obscureText: isShowPassword,
              decoration:  InputDecoration(
                hintText: "Confrim Password",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5)
                ),
                prefixIcon: const Icon(
                  Icons.key,
                ),
              ),
            ),
            const SizedBox(
              height: 36.0,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(280, 60),
                textStyle: const TextStyle(fontSize: 24),
                backgroundColor: const Color.fromRGBO(255, 204, 0, 1)
              ),
              onPressed: () async{
                if (newpassword.text.isEmpty) {
                  showMessage("New Password is empty");
                } else if (confirmpassword.text.isEmpty) {
                  showMessage("Confirm Password is empty");
                } else if (confirmpassword.text == newpassword.text) {
                  FirebaseAuthHelper.instance
                      .changePassword(newpassword.text, context);
                } else {
                  showMessage("Confrim Password is not match");
                }
              }, 
              child: const Text("Save",style: TextStyle(color: Colors.black))
            ),
          ],
        ),
      ),
    );
  }
}
