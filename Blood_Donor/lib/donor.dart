import 'package:hive/hive.dart';

part 'donor.g.dart';

@HiveType(typeId: 0)
class Donor extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  String bloodType;

  @HiveField(2)
  String contact;

  Donor({required this.name, required this.bloodType, required this.contact});
}
