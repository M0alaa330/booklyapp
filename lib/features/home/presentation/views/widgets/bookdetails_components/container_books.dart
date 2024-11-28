import 'package:flutter/material.dart';

class Containerbooks extends StatelessWidget {
  const Containerbooks({super.key, required this.imageUrl});
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Container(
        width: 70,
        height: 112,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
                image: NetworkImage(imageUrl!), fit: BoxFit.fill)),
      ),
    );
  }
}
