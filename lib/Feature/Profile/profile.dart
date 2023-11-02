import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:news/Core/colors.dart';
import 'package:news/Core/local_app.dart';

class Profile_page extends StatefulWidget {
  const Profile_page({super.key});

  @override
  State<Profile_page> createState() => _Profile_pageState();
}

String? imag_path;
String name = "";
var textCon = TextEditingController();

class _Profile_pageState extends State<Profile_page> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    LocalApp.getData(LocalApp.nameKey).then((value) {
      name = value;
    });
    textCon = TextEditingController(text: name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FutureBuilder(
                future: LocalApp.getData(LocalApp.imagKey),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Stack(
                      children: [
                        CircleAvatar(
                          radius: 70,
                          backgroundImage: FileImage(File(snapshot.data!)),
                        ),
                        GestureDetector(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return SimpleDialog(
                                    contentPadding: const EdgeInsets.all(15),
                                    backgroundColor: AppColors.grey,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    children: [
                                      GestureDetector(
                                        onTap: () async {
                                          await getImageFromCamera()
                                              .then((value) {
                                            Navigator.of(context).pop();
                                          });
                                        },
                                        child: Container(
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 15),
                                          height: 50,
                                          width: 200,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              color: AppColors.grey),
                                          child: const Center(
                                            child: Text(
                                              "upload from camera",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () async {
                                          await getImageFromGallery()
                                              .then((value) {
                                            Navigator.of(context).pop();
                                          });
                                        },
                                        child: Container(
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 15),
                                          height: 50,
                                          width: 200,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              color: AppColors.grey),
                                          child: const Center(
                                            child: Text(
                                              "upload from gallery",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                });
                          },
                          child: CircleAvatar(
                            radius: 15,
                            backgroundColor: AppColors.grey,
                            child: const Icon(
                              Icons.camera_alt_rounded,
                              size: 20,
                            ),
                          ),
                        ),
                      ],
                    );
                  } else {
                    return const CircleAvatar(
                      radius: 70,
                      backgroundImage: AssetImage("assets/user.jpg"),
                    );
                  }
                },
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: textCon,
                onFieldSubmitted: (value) {
                  if (name.isNotEmpty) {
                    LocalApp.cachData(LocalApp.imagKey, name);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("please enter your name")));
                  }
                },
                onChanged: (value) {
                  setState(() {
                    name = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: "enter your name",
                  hintStyle: TextStyle(color: AppColors.grey),
                ),
              )
            ],
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
