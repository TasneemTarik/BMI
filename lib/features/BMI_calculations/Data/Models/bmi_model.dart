import 'dart:convert';

import 'package:new_project/features/BMI_calculations/Data/Models/bmi_data_model.dart';

class BmiModel {
  final String? status;
  final dynamic error;
  final BmiDataModel? data;

  BmiModel({required this.status, required this.error,required this.data});

  factory BmiModel.fromjson(Map<String, dynamic> Json) {
    return BmiModel(
      status: Json['status'],
      error: Json['error'],
      data: BmiDataModel.fromjson(Json['data']),
    );
  }
}


