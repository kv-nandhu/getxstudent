// ignore_for_file: prefer_const_constructors
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:getxstudents/other/color.dart';
import 'package:intl/intl.dart';

void bottomSheet(context, int id, String photo, String name,
      String gender, String hub, String dob, String mobile, String email) {
  showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext builder) {
        return Container(
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(
              color: Color.fromARGB(255, 55, 61, 66),
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30), topLeft: Radius.circular(30))),
          height: 1000,
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              CircleAvatar(
                radius: 100,
                backgroundImage: FileImage(File(photo)),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                name.toUpperCase(),
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: CustomColor.getColor(),),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 11),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('hub : $gender',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w400,color: CustomColor.getColor(),))),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 11),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('week : $hub',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w400,color: CustomColor.getColor(),))),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 11),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Date of Birth: ${DateFormat('dd-MMM-yyyy').format(DateTime.parse(dob))}",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w400,color: CustomColor.getColor(),))),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 11),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Mobile: $mobile',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w400,color: CustomColor.getColor(),))),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 11),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('address : $email',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w400,color: CustomColor.getColor(),))),
              ),
            ],
          ),
        );
      });
}