// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:getxstudents/database/function.dart';
import 'package:getxstudents/views/add_student.dart';
import 'package:getxstudents/views/student_list.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    controller.getStudents();
    super.initState();
  }
  final controller = Get.put(DbFunctions());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
            bottom:
                Radius.elliptical(MediaQuery.of(context).size.width, 150.0))),       
    title: Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Row(
            children: [
              Image.asset(
                "images/flutter.png",
                height: 50,
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text.rich(
                    TextSpan(
                      text: 'Flutter',
                      style: TextStyle(
                        color: Color.fromARGB(255, 4, 142, 221),
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: ' ₿OX',
                          style: TextStyle(
                            color: Color.fromARGB(255, 235, 231, 231),
                            fontWeight: FontWeight.normal,
                            fontSize: 30,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    'F L U T T E R    D E VE L O P E R',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 250, 247, 247),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
    bottom: PreferredSize(
      preferredSize: Size.fromHeight(80), 
      child: SizedBox(
        height: 80),
    ),
  ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(children: [
            SizedBox(
              height: 200,
            ),
            Container(
                width: 250,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddStudentPage(
                            isEdit: false,
                          ),
                        ));
                  },
                  style: ButtonTheme(),
                  child: Text(
                    'Add Student',
                    style: GoogleFonts.ptMono(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )),
            SizedBox(
              height: 20,
            ),
            Container(
                width: 250,
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(const StudentList());
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color.fromARGB(255, 0, 0, 0)),
                    elevation: MaterialStateProperty.all<double>(8),
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                    ),
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      EdgeInsets.symmetric(vertical: 15.0, horizontal: 40.0),
                    ),
                  ),
                  child: Text(
                    'View Database',
                    style: GoogleFonts.ptMono(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ))
          ]),
        ),
      ),
    );
  }

  ButtonStyle ButtonTheme() {
    return ButtonStyle(
      backgroundColor:
          MaterialStateProperty.all<Color>(const Color.fromARGB(255, 0, 0, 0)),
      elevation: MaterialStateProperty.all<double>(8),
      shape: MaterialStateProperty.all<OutlinedBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
      ),
      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
        EdgeInsets.symmetric(vertical: 15.0, horizontal: 40.0),
      ),
    );
  }
}