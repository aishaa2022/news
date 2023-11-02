import 'dart:io';

import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:news/Core/local_app.dart';
import 'package:news/model/listview.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../Core/colors.dart';

class News_page extends StatefulWidget {
  const News_page({super.key});

  @override
  State<News_page> createState() => _News_pageState();
}

class _News_pageState extends State<News_page> {
  int page_index = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 4,
        child: Scaffold(
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        FutureBuilder(
                          future: LocalApp.getData(LocalApp.nameKey),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return Text(
                                "Hello, ${snapshot.data}",
                                style: const TextStyle(
                                    fontSize: 17, color: Colors.white),
                              );
                            } else {
                              return const Text(
                                "Hello, ",
                                style: TextStyle(
                                    fontSize: 17, color: Colors.white),
                              );
                            }
                          },
                        ),
                        Text(
                          "have anice day",
                          style: TextStyle(fontSize: 11, color: AppColors.grey),
                        )
                      ],
                    ),
                    FutureBuilder(
                      future: LocalApp.getData(LocalApp.imagKey),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return CircleAvatar(
                            radius: 25,
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                              radius: 22,
                              backgroundImage: FileImage(File(snapshot.data!)),
                            ),
                          );
                        } else {
                          return const CircleAvatar(
                            radius: 25,
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                              radius: 22,
                              backgroundImage: AssetImage("assets/user.jpg"),
                            ),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              CarouselSlider.builder(
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int itemIndex,
                          int pageViewIndex) =>
                      ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Image.asset(
                          "assets/user.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                  options: CarouselOptions(
                    onPageChanged: (index, reason) {
                      setState(() {
                        page_index = index;
                      });
                    },
                    height: 200,
                    viewportFraction: 0.7,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    enlargeFactor: 0.3,
                    scrollDirection: Axis.horizontal,
                  )),
              const SizedBox(
                height: 10,
              ),
              SmoothPageIndicator(
                controller:
                    PageController(initialPage: page_index), // PageController
                count: 5,
                effect: ScrollingDotsEffect(
                    dotHeight: 10,
                    dotWidth: 10,
                    activeDotColor:
                        AppColors.lamonada), // your preferred effect
              ),
              const SizedBox(
                height: 10,
              ),
              ButtonsTabBar(
                // Customize the appearance and behavior of the tab bar
                backgroundColor: AppColors.lamonada,
                borderWidth: 2,
                borderColor: Colors.black,
                labelStyle: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                unselectedLabelStyle: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                unselectedBackgroundColor: AppColors.grey,
                tabs: const [
                  Tab(
                    text: "science",
                  ),
                  Tab(
                    text: "Entertainment",
                  ),
                  Tab(
                    text: "sport",
                  ),
                  Tab(
                    text: "Business",
                  )
                ],
              ),
              Expanded(
                  child: TabBarView(
                children: [list(), list(), list(), list()],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
