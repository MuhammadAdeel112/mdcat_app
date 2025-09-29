import 'package:flutter/material.dart';
import 'package:mdcat/models/passing_result_model.dart';
// import '../models/result_model.dart';

class ResultProvider extends ChangeNotifier {
  late ResultModel _result;

  ResultModel get result => _result;

  void setResult(int total, int correct) {
    _result = ResultModel(totalQuestions: total, correctAnswers: correct);
    notifyListeners();
  }

  // double get percentage =>
  //     totalQuestions > 0 ? (correctAnswers / totalQuestions) * 100 : 0;
}
