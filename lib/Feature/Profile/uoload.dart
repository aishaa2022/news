import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:news/Core/colors.dart';
import 'package:news/Core/local_app.dart';
import 'package:news/Feature/Home/home.dart';

class UoloadView extends StatefulWidget {
  const UoloadView({super.key});

  @override
  State<UoloadView> createState() => _Profile_pageState();
}

class _Profile_pageState extends State<UoloadView> {
  String? imag_path;
  String name = " ";

  @override
  void initState() {
    super.initState();
    LocalApp.getData(LocalApp.imagKey).then((value) {
      setState(() {
        imag_path = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: AppColors.scaffoldColors,
            elevation: 0.0,
            actions: [
              IconButton(
                  onPressed: () {
                    if (name.isNotEmpty && imag_path != null) {
                      LocalApp.cachData(LocalApp.nameKey, name);
                      LocalApp.cachload(LocalApp.isUpload, true);
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const Home()));
                    } else if (imag_path == null && name.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content:
                              Text("please upload image and enter your name")));
                    } else if (imag_path == null && name.isNotEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("please upload image ")));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("please enter your name ")));
                    }
                  },
                  icon: Text(
                    "Done",
                    style: TextStyle(color: AppColors.lamonada, fontSize: 13),
                  ))
            ]),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: (imag_path != null)
                        ? FileImage(File(imag_path!)) as ImageProvider
                        : const AssetImage("assets/user.jpg"),
                  ),
                  GestureDetector(
                    onTap: () {
                      getImageFromCamera();
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 15),
                      height: 50,
                      width: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: AppColors.grey),
                      child: const Center(
                        child: Text(
                          "upload from camera",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      getImageFromGallery();
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 15),
                      height: 50,
                      width: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: AppColors.grey),
                      child: const Center(
                        child: Text(
                          "upload from gallery",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    color: AppColors.lamonada,
                    height: 10,
                    indent: 30,
                    endIndent: 30,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    onChanged: (value) {
                      setState(() {
                        name = value;
                      });
                    },
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: "enter your name",
                      hintStyle: TextStyle(color: AppColors.grey, fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  getImageFromCamera() async {
    final imagPacked =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (imagPacked != null) {
      LocalApp.cachData(LocalApp.imagKey, imagPacked.path);
      setState(() {
        imag_path = imagPacked.path;
      });
    }
  }

  getImageFromGallery() async {
    final imagPacked =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (imagPacked != null) {
      LocalApp.cachData(LocalApp.imagKey, imagPacked.path);

      setState(() {
        imag_path = imagPacked.path;
      });
    }
  }
}
