import 'package:hive_flutter/hive_flutter.dart';
import 'donor.dart';

class HiveService {
  static const String donorBoxName = 'donorBox';

  static Future<void> initHive() async {
    await Hive.initFlutter();
    Hive.registerAdapter(DonorAdapter());
    await Hive.openBox<Donor>(donorBoxName);
  }

  static Box<Donor> getDonorBox() {
    return Hive.box<Donor>(donorBoxName);
  }
}
