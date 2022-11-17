import 'package:flutter/material.dart';

import '../constant/colors.dart';

class BasePage extends StatelessWidget {
  final Widget page;
  const BasePage({super.key, required this.page});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: greyColor,
      child: SafeArea(
        child: Container(
          color: greyColor,
          child: page,
        ),
      ),
    );
  }
}
