import 'package:flutter/material.dart';
import 'package:news/Core/colors.dart';
import 'package:news/Core/local_app.dart';
import 'package:news/Feature/Home/home.dart';
import 'package:news/Feature/Profile/uoload.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4), () {
      LocalApp.getload(LocalApp.isUpload).then((value) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => value ? const Home() : const UoloadView()));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/logo.png",
            ),
            const SizedBox(
              height: 50,
            ),
            const Text(
              "Insight News",
              style: TextStyle(fontSize: 25, color: Colors.white),
            ),
            const SizedBox(
              height: 25,
            ),
            Text("Stay Informed, Anytime, Anywhere.",
                style: TextStyle(color: AppColors.grey, fontSize: 14))
          ],
        ),
      ),
    );
  }
}
