import 'package:flutter/material.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  List<Map<String, dynamic>> maPel = [
    {"nama": "App Developer", "icon": Icons.phone_android},
    {"nama": "Web Developer", "icon": Icons.language},
    {"nama": "Data Analyst", "icon": Icons.bar_chart},
    {"nama": "Jaringan Komputer", "icon": Icons.router},
    {"nama": "Teknik Komputer", "icon": Icons.memory},
    {"nama": "Desain Grafis", "icon": Icons.palette},
    {"nama": "Cyber Security", "icon": Icons.security},
    {"nama": "Game Developer", "icon": Icons.sports_esports},
    {"nama": "UI/UX Designer", "icon": Icons.design_services},
    {"nama": "Software Engineer", "icon": Icons.code},
    {"nama": "Cloud Computing", "icon": Icons.cloud},
    {"nama": "Artificial Intelligence", "icon": Icons.psychology},
    {"nama": "Machine Learning", "icon": Icons.smart_toy},
    {"nama": "Database Administrator", "icon": Icons.storage},
    {"nama": "DevOps Engineer", "icon": Icons.settings},
    {"nama": "Full Stack Developer", "icon": Icons.web},
    {"nama": "Back End Developer", "icon": Icons.dns},
    {"nama": "Front End Developer", "icon": Icons.monitor},
    {"nama": "Mobile Developer", "icon": Icons.mobile_friendly},
    {"nama": "Blockchain Developer", "icon": Icons.currency_bitcoin},
    {"nama": "IT Support", "icon": Icons.support_agent},
    {"nama": "System Analyst", "icon": Icons.analytics},
    {"nama": "Network Engineer", "icon": Icons.wifi},
    {"nama": "Embedded System", "icon": Icons.developer_board},
    {"nama": "Big Data Engineer", "icon": Icons.dataset},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 18, 1, 65),
        centerTitle: true,
        title: const Text(
          "Jurusan IT",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: maPel.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color.fromARGB(255, 18, 1, 65),
                width: 2,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              leading: Icon(
                maPel[index]["icon"],
                color: const Color.fromARGB(255, 18, 1, 65),
              ),
              title: Text(
                maPel[index]["nama"],
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}