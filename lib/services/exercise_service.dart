import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:study_case/helpers/api_connection.dart';

class ExerciseService {
  ApiConnection apiConnection = ApiConnection();

  getExercises() async {
    try {
      var headers = {
        'X-RapidAPI-Key': apiConnection.apiKey,
        'X-RapidAPI-Host': apiConnection.apiHost
      };

      var response = await Dio().get(
        apiConnection.url,
        options: Options(
          headers: headers,
        ),
      );

      if (response.statusCode == 200) {
        var data = response.data;
        log(data.toString());
        return data;
      } else {
        return 0;
      }
    } catch (e) {
      log(e.toString());
      return 0;
    }
  }
}
