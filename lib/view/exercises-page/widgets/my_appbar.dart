part of exercisespage_view;

class MyAppBar extends StatelessWidget {
  const MyAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ExerciseViewModel exerciseViewModel = Get.find();
    TextEditingController searchController = TextEditingController();

    return SliverAppBar(
      backgroundColor: greyColor,
      pinned: true,
      flexibleSpace: Row(
        children: [
          MyTextFormField(
              searchController: searchController,
              exerciseViewModel: exerciseViewModel),
          const SizedBox(
            width: 8,
          ),
          const FilterButton(),
        ],
      ),
    );
  }
}

class FilterButton extends StatelessWidget {
  const FilterButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (_) => Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: const FilterPopup(),
          ),
        );
      },
      child: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: whiteColor,
        ),
        child: const Padding(
          padding: EdgeInsets.all(14),
          child: FaIcon(FontAwesomeIcons.sliders, size: 18),
        ),
      ),
    );
  }
}

class MyTextFormField extends StatelessWidget {
  const MyTextFormField({
    Key? key,
    required this.searchController,
    required this.exerciseViewModel,
  }) : super(key: key);

  final TextEditingController searchController;
  final ExerciseViewModel exerciseViewModel;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Obx(() {
        exerciseViewModel.isFiltered.value
            ? searchController.text = searchController.text
            : searchController.text = "";

        return TextFormField(
          controller: searchController,
          onFieldSubmitted: (value) {
            exerciseViewModel.getExercisesByString(value);
          },
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(232),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.only(left: 28),
            filled: true,
            fillColor: whiteColor,
            hintText: "Search",
            hintStyle: const TextStyle(
              color: blackColor,
              fontWeight: FontWeight.w300,
              fontSize: 14,
            ),
          ),
        );
      }),
    );
  }
}

class FilterPopup extends StatelessWidget {
  const FilterPopup({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ExerciseViewModel exerciseViewModel = Get.find();

    return Obx(() {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
        ),
        height: 150,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Center(
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        exerciseViewModel.changeFilterIndex(0);
                      },
                      child: FaIcon(
                        exerciseViewModel.filterIndex.value == 0
                            ? FontAwesomeIcons.squareCheck
                            : FontAwesomeIcons.square,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text("Filter By Muscle"),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      exerciseViewModel.changeFilterIndex(1);
                    },
                    child: FaIcon(
                      exerciseViewModel.filterIndex.value == 1
                          ? FontAwesomeIcons.squareCheck
                          : FontAwesomeIcons.square,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text("Filter By Type"),
                  ),
                ],
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  height: 48,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: greyColor,
                  ),
                  child: const Center(
                    child: Text("Select"),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
