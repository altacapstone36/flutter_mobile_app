import 'package:flutter/cupertino.dart';
import 'package:hospital_management/model/report/report_model.dart';

import '../../enums.dart';

class ReportViewModel with ChangeNotifier {
  final List<ReportModel> _report = [];
  List<ReportModel> get report => _report;

  DataState _state = DataState.loading;
  DataState get state => _state;

  void changeState(DataState s) {
    _state = s;
    notifyListeners();
  }

  void addReport(ReportModel report) {
    try {
      changeState(DataState.loading);
      _report.add(report);
      notifyListeners();
      changeState(DataState.succes);
    } catch (e) {
      print(e.toString());
      changeState(DataState.error);
    }
  }

  void loadReport() {
    List<ReportModel> data = [];
    data = _report;
  }
}
