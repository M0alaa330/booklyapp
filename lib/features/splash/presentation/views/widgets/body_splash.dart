import 'package:bookly/core/utlis/assets.dart';
import 'package:bookly/core/utlis/fonts.dart';
import 'package:bookly/features/home/presentation/views/home_screen.dart';
import 'package:flutter/material.dart';

class BodySplash extends StatefulWidget {
  const BodySplash({super.key});

  @override
  State<BodySplash> createState() => _BodySplashState();
}

class _BodySplashState extends State<BodySplash> {
  @override
  void initState() {
    super.initState(); // You also need to call super.initState()

    Future.delayed(const Duration(seconds: 4), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return const HomeScreen();
      }));
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
              Assets.logo,
              width: 150,
              height: 50,
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              'Read Free Books',
              style: textStyle(
                color: Colors.white,
                fontweight: FontWeight.bold,
                fontsize: 25,
              ),
            )
          ],
        ),
      ),
    );
  }
}
