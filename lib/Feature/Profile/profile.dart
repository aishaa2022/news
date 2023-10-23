import 'package:flutter/material.dart';
import 'package:news/Core/colors.dart';

class Profile_page extends StatelessWidget {
  const Profile_page({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Text(
              "profile",
              style: TextStyle(color: AppColors.lamonada),
            )
          ],
        ),
      ),
    );
  }
}
