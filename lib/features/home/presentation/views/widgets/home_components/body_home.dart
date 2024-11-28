import 'package:bookly/core/utlis/fonts.dart';
import 'package:bookly/features/home/presentation/views/widgets/home_components/bestsellerbooks_listview.dart';
import 'package:bookly/features/home/presentation/views/widgets/home_components/custom_appbar.dart';
import 'package:bookly/features/home/presentation/views/widgets/home_components/cutsom_listview.dart';
import 'package:flutter/material.dart';

class BodyHome extends StatelessWidget {
  const BodyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(top: 50, left: 10, right: 10),
      child: CustomScrollView(slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              const Customappbar(),
              const SizedBox(
                height: 50,
              ),
              const CustomListView(
                size: 220,
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                margin: const EdgeInsets.only(
                  right: 240,
                ),
                child: Text(
                  softWrap: true,
                  "Best Books",
                  style: textStyle(
                      color: Colors.white,
                      fontweight: FontWeight.bold,
                      fontsize: 18),
                ),
              ),
              const BestBooksListview()
            ],
          ),
        ),
      ]),
    ));
  }
}
