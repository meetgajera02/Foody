// ignore_for_file: non_constant_identifier_names
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foody/screens/Order.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import '../Login/sign_in.dart';
import '../app_provider.dart';
import '../constants/routes.dart';
import 'change_password.dart';
import 'update.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(
      context,
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: ()=> Navigator.pop(context, false), 
          icon: const Icon(Icons.arrow_back_ios,)
        ),
        title:  Text("Profile",style:GoogleFonts.josefinSans(fontSize:22,color:const Color.fromARGB(255, 178, 125, 0))),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 40,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal:20,vertical:10),
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Row(
                children: [
                  // appProvider.getUserInformation.image == null
                  //   ? const Icon(
                  //       Icons.person_outline,
                  //       size: 120,
                  //     )
                  //   : CircleAvatar(
                  //       backgroundImage:
                  //           NetworkImage(appProvider.getUserInformation.image!),
                  //       radius: 60,
                  //     ),.
                  
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset('assets/images/meet.JPG',width: 96,height: 96)
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(appProvider.getUserInformation.name,style:GoogleFonts.jaldi(fontSize:26)),
                      Text("+91 ${appProvider.getUserInformation.phone}",style:GoogleFonts.jaldi(fontSize:22,color:const Color.fromARGB(125, 87, 87, 85))),
                      TextButton(
                        onPressed: () {Routes.instance.push(widget: const update(), context: context);},
                        child:Text("View Profile",style:GoogleFonts.jaldi(fontSize:22,color:const Color.fromARGB(255, 178, 125, 0))), 
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal:30,vertical:10),
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Row(
                children: [
                  const FaIcon(FontAwesomeIcons.clock,color:  Color.fromARGB(255, 178, 125, 0)),
                  const SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Store Delivery Info",style:GoogleFonts.jaldi(fontSize:20,color:const Color.fromARGB(255, 178, 125, 0))),
                      Text("Approx Delivery Time is: 30 mins",style:GoogleFonts.jaldi(fontSize:20,color:const Color.fromARGB(125, 87, 87, 85))),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              child: Column(
                children: [
                  Prifilemenu(title: 'Share this app',icon: Icons.share,onPressed: (){Share.share('com.example.foody');}),
                  Prifilemenu(title: 'Rate Us',icon: Icons.star_border,onPressed: (){}),
                  Prifilemenu(
                    title: 'Your Order',
                    icon: Icons.shopping_cart,
                    onPressed: (){Routes.instance.push(widget: const Order(), context: context);}
                  ),
                  Prifilemenu(
                    title: 'Change Password',
                    icon: Icons.change_circle_outlined,
                    onPressed: (){Routes.instance.push(widget: const ChangePassword(), context: context);}
                  ),
                  const Divider(),
                  Prifilemenu(
                    title: 'Logout',
                    icon: Icons.logout,
                    onPressed: () {
                      FirebaseAuth.instance.signOut().then((value) {
                        Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => const Sing_in()));
                      });
                    },
                    TextColor:  const Color.fromARGB(255, 178, 125, 0),
                    endIcon: false
                  ),   
                ],
              ),             
            ),
          ],
        ),
      ),
    );
  }
}


class Prifilemenu extends StatelessWidget {
  const Prifilemenu({super.key,
  required this.title,
  required this.icon,
  required this.onPressed,
  this.endIcon = true,
  this.TextColor,
  });

  final String title;
  final IconData icon;
  final VoidCallback onPressed;
  final bool endIcon;
  final Color? TextColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPressed,
      leading: Container(
        width: 45,
        height: 45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          border: Border.all(
            color: Colors.grey
          ),
        ),
        child: Icon(icon),
      ),
      title: Text(title,style:GoogleFonts.lato(fontSize:20,color: Colors.black).apply(color: TextColor)),
      trailing: endIcon? Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Colors.grey.withOpacity(0.1)
        ),
        child: const Icon(FontAwesomeIcons.angleRight, color: Colors.grey,size: 18.0)):null
    );
  }
}