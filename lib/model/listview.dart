import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:news/Core/colors.dart';

Widget list() {
  return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemBuilder: (Context, index) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          height: 100,
          decoration: BoxDecoration(
              color: AppColors.grey, borderRadius: BorderRadius.circular(20)),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  "assets/user.jpg",
                  height: 100,
                  width: 190,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text(
                        "Man City stay perfect despite Rodri red against Forest"),
                    Row(
                      children: [
                        SvgPicture.asset("assets/read.svg"),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text("read"),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
      separatorBuilder: (Context, index) {
        return const Divider();
      },
      itemCount: 5);
}
