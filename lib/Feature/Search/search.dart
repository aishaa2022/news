import 'package:flutter/material.dart';
import 'package:news/model/listview.dart';

import '../../Core/colors.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.scaffoldColors,
          title: const Text(
            "Find Your News",
            style: TextStyle(fontSize: 18),
          ),
          centerTitle: true,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Search",
                  hintStyle: TextStyle(color: AppColors.grey, fontSize: 20),
                  prefixIcon: const Icon(Icons.search),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "total result:10",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(child: list())
            ],
          ),
        ),
      ),
    );
  }
}
