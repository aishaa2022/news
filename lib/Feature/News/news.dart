import 'package:flutter/material.dart';

import '../../Core/colors.dart';

class News_page extends StatelessWidget {
  const News_page({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Text(
              "news,",
              style: TextStyle(color: AppColors.lamonada),
            )
          ],
        ),
      ),
    );
  }
}
