import 'dart:developer';

import 'package:get/get.dart';
import 'package:study_case/model/exercise_model.dart';
import 'package:study_case/services/exercise_service.dart';

class ExerciseViewModel extends GetxController {
  var exercises = <ExerciseModel>[].obs;
  var filterExercises = <ExerciseModel>[].obs;
  var isFiltered = false.obs;

  // 0 => filter by Muscle
  // 1 => filter by Type
  var filterIndex = 0.obs;

  ExerciseService exerciseService = ExerciseService();

  @override
  onInit() {
    super.onInit();
    getExercises();
  }

  getExercises() async {
    var result = await exerciseService.getExercises();

    if (result is List) {
      for (var element in result) {
        var model = ExerciseModel.fromMap(element);
        exercises.add(model);
        log(model.name ?? "");
      }
    }
  }

  getExercisesByString(String value) {
    if (value == "" || value.isEmpty) {
      isFiltered.value = false;
      filterExercises.clear();
      return;
    }

    isFiltered.value = true;

    filterExercises.clear();

    if (filterIndex.value == 0) {
      for (var element in exercises) {
        String muscle = element.muscle ?? "Muscle";
        if (muscle.contains(value)) {
          filterExercises.add(element);
        }
      }
      return;
    }
    isFiltered.value == true;
    for (var element in exercises) {
      String type = element.type ?? "Type";
      if (type.contains(value)) {
        filterExercises.add(element);
      }
    }
  }

  clearFilter() {
    isFiltered.value = false;
  }

  changeFilterIndex(int index) {
    filterIndex.value = index;
  }
}
