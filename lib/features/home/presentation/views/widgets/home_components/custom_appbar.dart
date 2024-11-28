import 'package:bookly/core/utlis/assets.dart';
import 'package:flutter/material.dart';

class Customappbar extends StatelessWidget {
  const Customappbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(
          Assets.logo,
          width: 120,
        ),
        InkWell(
          onTap: () {},
          splashColor: Colors.black,
          child: Image.asset(
            "assets/images/serach.png",
            width: 35,
          ),
        ),
      ],
    );
  }
}
