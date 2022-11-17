library exercisespage_view;

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:study_case/constant/colors.dart';
import 'package:study_case/model/exercise_model.dart';
import 'package:study_case/view-model/exercise_viewmodel.dart';

import '../../constant/text_styles.dart';

part '../exercises-page/widgets/my_appbar.dart';
part '../exercises-page/widgets/my_list.dart';

class ExercisesPage extends StatelessWidget {
  const ExercisesPage({super.key});

  @override
  Widget build(BuildContext context) {
    ExerciseViewModel exerciseViewModel = Get.put(ExerciseViewModel());

    return Scaffold(
      body: Container(
        color: greyColor,
        child: const Padding(
          padding: EdgeInsets.only(left: 16.0, top: 16.0, right: 16.0),
          child: CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: [
              MyAppBar(),
              MyList(),
            ],
          ),
        ),
      ),
      floatingActionButton: Obx(() {
        return exerciseViewModel.isFiltered.value
            ? FloatingActionButton(
                onPressed: () {
                  exerciseViewModel.clearFilter();
                },
                backgroundColor: Colors.red,
                child: const FaIcon(FontAwesomeIcons.brush),
              )
            : Container();
      }),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
