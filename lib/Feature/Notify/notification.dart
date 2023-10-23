import 'package:flutter/material.dart';

import '../../Core/colors.dart';

class Notify extends StatelessWidget {
  const Notify({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Text(
              "noyify",
              style: TextStyle(color: AppColors.lamonada),
            )
          ],
        ),
      ),
    );
  }
}
