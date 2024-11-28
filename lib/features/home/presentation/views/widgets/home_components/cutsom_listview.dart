import 'package:bookly/features/home/presentation/controller/allbookscubit/all_books_cubit.dart';
import 'package:bookly/features/home/presentation/controller/allbookscubit/all_books_state.dart';
import 'package:bookly/features/home/presentation/views/widgets/home_components/custom_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomListView extends StatelessWidget {
  const CustomListView({
    super.key,
    required this.size,
  });

  final double size;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllBooksCubit, AllBooksState>(
      builder: (context, state) {
        if (state is Loadedallbookssate) {
          return SizedBox(
            height: size,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.books.items?.length, // Ensure books is non-null
              itemBuilder: (context, index) {
                return CustomContainer(
                  allbooks: state.books.items![index],
                );
              },
            ),
          );
        } else if (state is Errorallbooksstate) {
          return Text(state.error); // Display error message
        } else {
          return const Center(
              child: CircularProgressIndicator()); // Return loading indicator
        }
      },
    );
  }
}





// class Customlistview extends StatelessWidget {
//   const Customlistview({
//     super.key,
//     required this.size,
//   });
//   final double size;

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<AllBooksCubit,AllBooksState >(
//       builder: (context, state) {
//         if(state is Loadedallbookssate){
//           return SizedBox(
//       height: size,
//       child: ListView.builder(
//           scrollDirection: Axis.horizontal,
//           itemCount: state.books!.length,
//           itemBuilder: (context, index) {
//             return  CustomContainer(booksmodel:state.books![index]);
//           }),
//     );
//         } else if(state is Errorallbooksstate){
//           return Text(state.error);
//         }else{
//          const Center(child: CircularProgressIndicator());
//         }
//       },
//     );
//   }
// }