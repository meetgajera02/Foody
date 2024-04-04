import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
//import 'Order.dart';
import '../app_provider.dart';
import '../firebase_services/firebase_firestore.dart';
import '../models/product_model.dart';
import 'Wishlist.dart';
import 'card.dart';
import 'home_screen.dart';
import 'menu.dart';
import 'profile.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex=0;
  static final List<Widget>_widgetOptions =<Widget>[
    const Homepage(),
    const Menu(),
    const Cart(),
    const Wishlist(),
    const Profile()
  ];

  List<ProductModel> productModelList = [];
  bool isLoading = false;
  @override
  void initState() {
    AppProvider appProvider = Provider.of<AppProvider>(context, listen: false);
    appProvider.getUserInfoFirebase();
    getCategoryList();
    super.initState();
  }

  void getCategoryList() async {
    setState(() {
      isLoading = true;
    });
    productModelList = await FirebaseFirestoreHelper.instance.dosa();
    //productModelList.shuffle();
    setState(() {
      isLoading = false;
    });
  }

  void _onItemTapped(int index){
    setState(() {
      _selectedIndex=index;
    });
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions[_selectedIndex], 
        ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        elevation: 10,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        selectedItemColor:  const Color.fromRGBO(255, 204, 0, 1),
        unselectedItemColor: Colors.black,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.fastfood_outlined), label: "Menu"),
          BottomNavigationBarItem(icon: Icon(Icons.card_giftcard), label: "Card"),
          BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.heart), label: "Wishlist"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      )
    );
  }
}