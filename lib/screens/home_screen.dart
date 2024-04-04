import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foody/screens/burder.dart';
import 'package:foody/screens/pizza.dart';
import 'package:google_fonts/google_fonts.dart';
import 'menu.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Container(
                height:50,
              ),
              Row(
                children: [
                  Image.asset("assets/images/logo.png",width: 48,height: 48),
                  const SizedBox( width: 10),
                  Text("Foody World",
                    style:GoogleFonts.luckiestGuy(fontSize: 20)
                  ),
                  const Spacer(),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset('assets/images/meet.JPG',width: 48,height: 48)
                  ),
                ]
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration:  InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  prefixIcon: const Icon(Icons.search),
                  hintText: "Food,drinks or brownie...",
                )
              ),
              const SizedBox(height: 20),
              Image.asset("assets/images/Rectangle.png"),
              const SizedBox(height:20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CupertinoButton(
                      onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> const Burger()));},
                      child: Container(
                        width: 65,
                        height:100,
                        decoration: BoxDecoration(
                          borderRadius:  BorderRadius.circular(10),
                          border: Border.all(color: Colors.black)
                        ),
                        child:Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset("assets/images/burger.png"),
                              Text("Burger",style:GoogleFonts.josefinSans(fontSize:18,color: Colors.black))
                            ],
                          ),
                        )
                      ),
                    ), 
                    CupertinoButton(
                      onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context)=> const pizza()));},
                      child: Container(
                        width: 65,
                        height:100,
                        decoration: BoxDecoration(
                          borderRadius:  BorderRadius.circular(10),
                          border: Border.all(color: Colors.black)
                        ),
                        child:Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset("assets/images/pizza.png"),
                              Text("Pizza",style:GoogleFonts.josefinSans(fontSize:18,color: Colors.black))
                            ],
                          ),
                        )
                      ),
                    ), 
                    CupertinoButton(
                      onPressed: () {  },
                      child: Container(
                        width: 65,
                        height:100,
                        decoration: BoxDecoration(
                          borderRadius:  BorderRadius.circular(10),
                          border: Border.all(color: Colors.black)
                        ),
                        child:Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset("assets/images/dessert.png"),
                              Text("Dessert",style:GoogleFonts.josefinSans(fontSize:18,color: Colors.black))
                            ],
                          ),
                        )
                      ),
                    ), 
                    CupertinoButton(
                      onPressed: () {  },
                      child: Container(
                        width: 65,
                        height:100,
                        decoration: BoxDecoration(
                          borderRadius:  BorderRadius.circular(10),
                          border: Border.all(color: Colors.black)
                        ),
                        child:Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset("assets/images/drink.png"),
                              Text("Drink",style:GoogleFonts.josefinSans(fontSize:18,color: Colors.black))
                            ],
                          ),
                        )
                      ),
                    ), 
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Text("Our Menu",style:GoogleFonts.josefinSans(fontSize:22)),
                  const Spacer(),
                  TextButton(
                    onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> const Menu()));},
                    child: const Text("See all",style:TextStyle(fontSize:21,color:Colors.orange))
                  )
                ],
              ),
              const SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Column(
                      children: [
                        Image.asset("assets/images/Rectangle7.png"),
                        Text("Daylight Coffee",style:GoogleFonts.lato(fontSize:22)),
                      ],
                    ),
                    const SizedBox(width:20),
                    Column(
                      children: [
                        Image.asset("assets/images/Rectangle8.png"),
                        Text("Dark Brownie",style:GoogleFonts.lato(fontSize:22)),
                      ],
                    ),
                  ],
                ),
                
              ),
            ],
          ),
        ),
      ),
      
    );
  }
}