part of exercisespage_view;

class MyList extends StatelessWidget {
  const MyList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ExerciseViewModel exerciseViewModel = Get.find();

    return SliverList(
      delegate: SliverChildListDelegate(
        [
          Obx(
            () {
              return Column(
                children: [
                  SizedBox(
                    child: Column(
                      children: [
                        exerciseViewModel.isFiltered.value
                            ? Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                child: Text(
                                    "${exerciseViewModel.filterExercises.length} results found."),
                              )
                            : Container(),
                        exerciseViewModel.exercises.isEmpty
                            ? Container()
                            : ListView.builder(
                                physics: const BouncingScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: exerciseViewModel.isFiltered.value
                                    ? exerciseViewModel.filterExercises.length
                                    : exerciseViewModel.exercises.length,
                                itemBuilder: (context, index) {
                                  return Expanded(
                                    child: ExerciseBox(
                                        model:
                                            exerciseViewModel.isFiltered.value
                                                ? exerciseViewModel
                                                    .filterExercises[index]
                                                : exerciseViewModel
                                                    .exercises[index]),
                                  );
                                },
                              ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

class ExerciseBox extends StatelessWidget {
  final ExerciseModel model;
  const ExerciseBox({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      height: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: whiteColor,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              model.name ?? "Exercise Name",
              style: exerciseBoxHeader,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
                color: greyColor,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                child: Text(
                  model.type ?? "Exercise Type",
                  style: exerciseBoxType,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              model.muscle ?? "Muscle",
              style: exerciseBoxMuscle,
            ),
          ],
        ),
      ),
    );
  }
}
