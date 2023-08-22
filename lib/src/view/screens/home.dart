import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  String title;
  HomeScreen({super.key, required this.title});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex =0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Ecommerce"),
      ),
      drawer: Drawer(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value) {
          print("current value: $value");
          currentIndex = value;
          setState(() {});
        },
        items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Products"),
      BottomNavigationBarItem(icon: Icon(Icons.shopping_cart))]),
    );
  }
}
