import 'package:flutter/material.dart';
import 'package:news/Core/colors.dart';
import 'package:news/splash.dart';

void main() {
  runApp(const News());
}

class News extends StatelessWidget {
  const News({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: AppColors.scaffoldColors,
          inputDecorationTheme: InputDecorationTheme(
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: AppColors.lamonada)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: AppColors.lamonada)),
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(color: Colors.red)),
              prefixIconColor: AppColors.lamonada,
              suffixIconColor: AppColors.lamonada,
              labelStyle: TextStyle(color: AppColors.grey))),
      home: const Splash(),
    );
  }
}
