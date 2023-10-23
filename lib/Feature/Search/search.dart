import 'package:flutter/material.dart';

import '../../Core/colors.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Text(
              "search",
              style: TextStyle(color: AppColors.lamonada),
            )
          ],
        ),
      ),
    );
  }
}
