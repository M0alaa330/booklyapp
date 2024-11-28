import 'package:bookly/features/home/data/model/books_model.dart';
import 'package:bookly/features/home/presentation/views/bookdetails_screen.dart';
import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key,
    required this.allbooks,
  });
  final Items allbooks;

  @override
  Widget build(BuildContext context) {
    final imageurl = allbooks.volumeInfo?.imageLinks?.thumbnail;
    return InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return BookdetailsScreen(
              booksinfo: allbooks,
            );
          }));
        },
        child: Container(
          margin: const EdgeInsets.only(right: 5),
          width: 200,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                  image: NetworkImage(imageurl!), fit: BoxFit.fill)),
        ));
  }
}
