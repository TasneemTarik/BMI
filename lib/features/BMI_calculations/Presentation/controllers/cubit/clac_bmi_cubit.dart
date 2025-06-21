import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:new_project/core/Api_service.dart';

import '../../../Data/Models/bmi_model.dart';

part 'clac_bmi_state.dart';

class BmiCubit extends Cubit<ClacBmiState> {
  BmiModel? bmiModel;
  BmiCubit() : super(BmiInitial());

  String? name;

  int? age;
  dynamic response;
 
  Future<void> fetchbmi(double weight, double height) async {
    try {
      emit(Bmiloaded());

      Dio dio = Dio();
      String baseurl = "https://api.apiverve.com/v1/bmicalculator";

      response = await dio.get(
        '$baseurl?weight=$weight&height=$height&unit=metric',
        options: Options(
          headers: {"x-api-key": "85bcf62f-a6ff-47c7-95c8-53ee9c1a32ad"},
        ),
      );

      if (response.statusCode == 200) {
        bmiModel = BmiModel.fromjson(
          jsonDecode(response.data) as Map<String, dynamic>,
        );
        emit(Bmisuccess()); // Now bmiModel is set
      } else {
        emit(Bmifailed(errmessage: 'Error in getting data'));
      }
    } catch (e) {
      emit(Bmifailed(errmessage: e.toString()));
    }
    // }
    //   Future<BmiModel> fetchbmi(double weight, double height) async {
    //     Dio dio = Dio();
    //     String baseurl = "https://api.apiverve.com/v1/bmicalculator";

    //     response = await dio.get(
    //       '$baseurl?weight=$weight&height=$height&unit=metric',
    //       options: Options(
    //         headers: {"x-api-key": "85bcf62f-a6ff-47c7-95c8-53ee9c1a32ad"},
    //       ),
    //     );
    //     emit(Bmiloaded());
    //     if (response.statusCode == 200) {
    //       emit(Bmisuccess());
    //       return BmiModel.fromjson(
    //         jsonDecode(response.data) as Map<String, dynamic>,
    //       );
    //     } else {
    //       emit(Bmifailed(errmessage: 'error in getting data'));
    //       throw Exception('Failed to load album');
    //     }
    //   }
  }
}
