import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../screens/burder.dart';
import '../screens/dosa.dart';
import 'package:google_fonts/google_fonts.dart';
import 'pizza.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 70,
            ),
            const Padding(padding: EdgeInsets.symmetric(horizontal: 18)),
            Row(
              children: [
                const Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                IconButton(
                  onPressed: ()=> Navigator.pop(context, false), 
                  icon: const Icon(Icons.arrow_back_ios,)
                ),
                Text("Our Menu",style:GoogleFonts.josefinSans(fontSize:22,color:const Color.fromARGB(255, 178, 125, 0))),
              ],
            ),
            SizedBox(
              //padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      CupertinoButton(
                        onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> const pizza()));},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assets/images/Rectangle20.png",width: 145),
                            const SizedBox(height: 5),
                            const Text("Pizza")
                          ],
                        ),
                      ),
                      const Spacer(),
                      CupertinoButton(
                        onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> const Burger()));},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assets/images/Rectangle21.png",width: 145),
                            const SizedBox(height: 5),
                            const Text("Burger")
                          ],
                        ),
                      ),
                    ]
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      CupertinoButton(
                        onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> const Dosa()));},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assets/images/Rectangle16.png",width: 145),
                            const SizedBox(height: 5),
                            const Text("Dosa")
                          ],
                        ),
                      ),
                      const Spacer(),
                      CupertinoButton(
                        onPressed: (){},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assets/images/Rectangle17.png",width: 145),
                            const SizedBox(height: 5),
                            const Text("Noodles")
                          ],
                        ),
                      ),
                    ]
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      CupertinoButton(
                        onPressed: (){},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assets/images/Rectangle27.png",width: 145),
                            const SizedBox(height: 5),
                            const Text("Sandwich")
                          ],
                        ),
                      ),
                      const Spacer(),
                      CupertinoButton(
                        onPressed: (){},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assets/images/Rectangle29.png",width: 145),
                            const SizedBox(height: 5),
                            const Text("French Fries"),
                          ],
                        ),
                      ),
                    ]
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      CupertinoButton(
                        onPressed: (){},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assets/images/Rectangle23.png",width: 145),
                            const SizedBox(height: 5),
                            const Text("Wine")
                          ],
                        ),
                      ),
                      const Spacer(),
                      CupertinoButton(
                        onPressed: (){},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assets/images/Rectangle25.png",width: 145),
                            const SizedBox(height: 5),
                            const Text("Beer")
                          ],
                        ),
                      ),
                    ]
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
