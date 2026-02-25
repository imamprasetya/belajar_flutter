import 'package:flutter/material.dart';
import 'list.dart';
import 'map.dart';
import 'model.dart';

class Tugas9Flutter extends StatefulWidget {
  const Tugas9Flutter({super.key});

  @override
  State<Tugas9Flutter> createState() => _Tugas9FlutterState();
}

class _Tugas9FlutterState extends State<Tugas9Flutter> {

  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    ListPage(),   
    MapPage(),
    ModelPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: const Color.fromARGB(255, 0, 25, 46),

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: "List",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: "Map",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: "Model",
          ),
        ],
      ),
    );
  }
}