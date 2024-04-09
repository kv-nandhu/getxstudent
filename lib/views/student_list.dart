// ignore_for_file: prefer_const_constructors, depend_on_referenced_packages
import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:getxstudents/database/function.dart';
import 'package:getxstudents/database/student.dart';
import 'package:getxstudents/other/color.dart';
import 'package:getxstudents/views/add_student.dart';
import 'package:getxstudents/views/bottom.dart';
import 'package:getxstudents/views/home_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';

class StudentList extends StatefulWidget {
  const StudentList({super.key});

  @override
  State<StudentList> createState() => _StudentListState();
}
class _StudentListState extends State<StudentList> {
  @override
  void initState() {
    controller.getStudents();
    super.initState();
  }
  final SearchController = TextEditingController();
  String searchText = '';
  Timer? debouncer;
  final controller = Get.put(DbFunctions());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "student list",
            style: TextStyle(
              color: CustomColor.getColor(),
            ),
          ),
          leading: IconButton(
              onPressed: () {
                Get.off(HomePage());
              },
              icon: Icon(
                Icons.arrow_back,
              ))),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: TextFormField(
                controller: SearchController,
                onChanged: (value) {
                  onSearchChange(value);
                },
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: "Search name",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25))),
              ),
            ),
            SizedBox(
              height: 600,
              child: controller.studentList.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.network(
                            'https://assets-v2.lottiefiles.com/a/435a7e80-1153-11ee-a46f-7f1c0e4a511a/ePxvZATa5E.gif',
                            height: 200,
                          ),
                        ],
                      ),
                    )
                  : Obx(
                      () => ListView.separated(
                          itemBuilder: ((context, index) {
                            final data = controller.studentList[index];
                            return Slidable(
                              endActionPane: ActionPane(
                                motion: const DrawerMotion(),
                                children: [
                                  SlidableAction(
                                    onPressed: (context) {
                                      Get.to(AddStudentPage(
                                        isEdit: true,
                                        stu: data,
                                      ));
                                    },
                                    icon: Icons.edit,
                                    backgroundColor: Colors.lightBlue,
                                  ),
                                ],
                              ),
                              startActionPane: ActionPane(
                                  motion: const DrawerMotion(),
                                  children: [
                                    SlidableAction(
                                        onPressed: (context) {
                                          controller.deleteStudent(data.id!);
                                        },
                                        icon: Icons.delete,
                                        backgroundColor: Colors.red)
                                  ]),
                              child: ListTile(
                                onTap: () {
                                  bottomSheet(
                                      context,
                                      data.id!,
                                      data.photo,
                                      data.name,
                                      data.gender,
                                      data.hub,
                                      data.dob,
                                      data.mobile,
                                      data.email);
                                },
                                leading: CircleAvatar(
                                  radius: 40,
                                  backgroundImage: FileImage(File(data.photo)),
                                ),
                                title: Text(
                                  data.name!.toUpperCase(),
                                  style: GoogleFonts.dmMono(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                ),
                                subtitle: Text(
                                  data.hub.toUpperCase(),
                                  style: GoogleFonts.dmMono(
                                      fontSize: 18,
                                      fontWeight: FontWeight.normal),
                                  maxLines: 1,
                                ),
                              ),
                            );
                          }),
                          separatorBuilder: ((context, index) {
                            return Divider();
                          }),
                          itemCount: controller.studentList.length),
                    ),
            )
          ],
        ),
      ),
    );
  }

  onSearchChange(String value) {
    final studendb = Hive.box<StudentModel>('student_db');
    final students = studendb.values.toList();
    value = SearchController.text;

    if (debouncer?.isActive ?? false) debouncer?.cancel();
    debouncer = Timer(const Duration(milliseconds: 250), () {
      if (this.searchText != SearchController) {
        final filteredStudents = students
            .where((students) =>
                students.name.toLowerCase().contains(value.toLowerCase()))
            .toList();
        controller.studentList.value = filteredStudents;
      }
    });
  }

  TextStyle textStyle() {
    return GoogleFonts.dmMono(fontSize: 22);
  }
}
