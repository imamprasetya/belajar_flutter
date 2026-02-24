import 'package:flutter/material.dart';
import 'checkbox_page.dart';
import 'switch_page.dart';
import 'dropdown_page.dart';
import 'date_page.dart';
import 'time_page.dart';

class Tugas7Flutter extends StatelessWidget {
  const Tugas7Flutter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Tugas 7 Flutter",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 0, 25, 46),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [

            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 0, 25, 46),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person,
                        color: Color.fromARGB(255, 0, 25, 46)),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Menu Navigasi",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ],
              ),
            ),

            // CHECKBOX
            ListTile(
              leading: const Icon(Icons.check_box),
              title: const Text("Checkbox"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => CheckboxPage()),
                );
              },
            ),

            // SWITCH
            ListTile(
              leading: const Icon(Icons.toggle_on),
              title: const Text("Switch"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => SwitchPage()),
                );
              },
            ),

            // DROPDOWN
            ListTile(
              leading: const Icon(Icons.arrow_drop_down_circle),
              title: const Text("Dropdown"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => DropdownPage()),
                );
              },
            ),

            // DATE
            ListTile(
              leading: const Icon(Icons.calendar_month),
              title: const Text("Tanggal"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => DatePage()),
                );
              },
            ),

            // TIME
            ListTile(
              leading: const Icon(Icons.access_time),
              title: const Text("Jam"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => TimePage()),
                );
              },
            ),
          ],
        ),
      ),

      body: const Center(
        child: Text(
          "Mari Mulai Belajar",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}