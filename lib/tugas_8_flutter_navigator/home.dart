import 'package:flutter/material.dart';
import '../tugas_7_flutter/tugas_7_flutter.dart';
import 'tentang.dart';

class HomeTugas8 extends StatefulWidget {
  const HomeTugas8({super.key});

  @override
  State<HomeTugas8> createState() => _HomeTugas8State();
}

class _HomeTugas8State extends State<HomeTugas8> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [Tugas7Flutter(), TentangPage()];

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
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: "Tentang Aplikasi",
          ),
        ],
      ),
    );
  }
}
