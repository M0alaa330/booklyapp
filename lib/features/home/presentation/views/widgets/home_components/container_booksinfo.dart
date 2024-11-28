import 'package:bookly/core/utlis/fonts.dart';
import 'package:bookly/features/home/data/model/books_model.dart';
import 'package:bookly/features/home/presentation/views/bookdetails_screen.dart';
import 'package:flutter/material.dart';

class ContainerBooksInfo extends StatelessWidget {
  const ContainerBooksInfo({
    super.key,
     required this.bookinfo,
  });

   final Items bookinfo;

  @override
  Widget build(BuildContext context) {
    final thumbnailUrl = bookinfo.volumeInfo?.imageLinks?.thumbnail;

    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return BookdetailsScreen(booksinfo: bookinfo);
        }));
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        height: 108,
        width: double.infinity,
        child: Row(
          children: [
            SizedBox(
              width: 70,
              height: 105,
              child: thumbnailUrl != null
                  ? Image(
                      image: NetworkImage(thumbnailUrl),
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return const Center(child: Text('Image not available'));
                      },
                    )
                  : const Center(child: Text('No image available')),
            ),
            const SizedBox(width: 30),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    bookinfo.volumeInfo?.title ?? "Unknown Title",
                    maxLines: 2,
                    softWrap: true,
                    style: textStyle(
                        color: Colors.white,
                        fontweight: FontWeight.bold,
                        fontsize: 20),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 159.0),
                    child: Text(
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      bookinfo.volumeInfo?.authors?.isNotEmpty == true
                          ? bookinfo.volumeInfo!.authors!.first
                          : "Unknown Author",
                      style: textStyle(
                          color: Colors.white,
                          fontweight: FontWeight.bold,
                          fontsize: 14),
                    ),
                  ),
                  const SizedBox(height: 11),
                  Expanded(
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/images/image copy.png",
                          height: 12.8,
                          width: 13.37,
                        ),
                        const SizedBox(width: 6.31),
                        Text(
                          bookinfo.volumeInfo!.averageRating != null
                              ? bookinfo.volumeInfo!.averageRating.toString()
                              : '0',
                          style: textStyle(
                              color: Colors.white,
                              fontweight: FontWeight.bold,
                              fontsize: 16),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
