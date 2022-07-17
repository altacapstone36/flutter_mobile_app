import 'package:flutter/cupertino.dart';

class AttendanceViewModel with ChangeNotifier {
  String checkIn = '--/--';
  String checkOut = '--/--';
  bool visible = true;

  Future<void> reset() async {
    await Future.delayed(const Duration(hours: 20));
    checkIn = '--/--';
    checkOut = '--/--';
    visible = true;
  }
}
