import 'package:hive/hive.dart';
part 'student.g.dart';

@HiveType(typeId:1)
class StudentModel extends HiveObject{

  @HiveField(0)
  int? id; 

  @HiveField(1)
  String photo;

  @HiveField(2)
  String name;

  @HiveField(3)
  String gender;

  @HiveField(4)
  String hub;

  @HiveField(5)
  String dob;

  @HiveField(6)
  String mobile;

  @HiveField(7)
  String email;

  StudentModel({
    this.id,
    required this.photo,
    required this.name,
    required this.gender,
    required this.hub,
    required this.dob,
    required this.mobile,
    required this.email
  });
}