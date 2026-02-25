import 'package:flutter/material.dart';

class ListPage extends StatelessWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> MaPel = [
      "App Developer",
      "Web Developer",
      "Jaringan Komputer",
      "Data Analyst",
      "Desain Grafis",
      "Teknik Komputer",
      "Cyber Security",
      "Game Developer",
      "UI/UX Designer",
      "Software Engineer",
      "Cloud Computing",
      "Artificial Intelligence",
      "Machine Learning",
      "Database Administrator",
      "DevOps Engineer",
      "Full Stack Developer",
      "Back End Developer",
      "Front End Developer",
      "Mobile Developer",
      "Blockchain Developer",
      "IT Support",
      "System Analyst",
      "Network Engineer",
      "Embedded System",
      "Big Data Engineer",
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 18, 1, 65),
        centerTitle: true,
        title: Text("List Pelajaran",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 25,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: MaPel.length,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              margin: EdgeInsets.only(bottom: 10),
              height: 40,
              color: const Color.fromARGB(255, 216, 229, 255),
              child: Center(child: Text (MaPel[index]))
              ),
          );
        },
      ),
    );
  }
}