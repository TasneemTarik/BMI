import 'package:dio/dio.dart';
import 'package:new_project/features/BMI_calculations/Data/Models/bmi_data_model.dart';
import 'package:new_project/features/BMI_calculations/Data/Models/bmi_model.dart';

class ApiService {
  Dio dio = Dio();
  String baseurl = "https://api.apiverve.com/v1/bmicalculator";
   Future<BmiModel> getBmiData({required double weight,required double height}) async {
    var response = await dio.get(
      '$baseurl?weight=$weight&height=$height&unit=metric',
      options: Options(
        headers: {"x-api-key": "85bcf62f-a6ff-47c7-95c8-53ee9c1a32ad"},
      ),
    );
    return response.data;
  }
}
