
import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/books-action.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_details_app_bar.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/similar_books_list_view.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        children: [
          const CustomBookDetailsAppBar(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.17),
            child: const CustomBookImage(),
          ),
          const SizedBox(height: 30),
          const Text(
            'Harry Potter And The Deathly Hallows',
            style: Styles.textStyle30,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 6),
          Text(
            'J.K. Rowling',
            style: Styles.textStyle18.copyWith(fontStyle: FontStyle.italic),
          ),
          const SizedBox(height: 18),
          const BookRating(mainAxisAlignment: MainAxisAlignment.center),
          const SizedBox(height: 30),
          const BooksAction(),
          const SizedBox(height: 20),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "You can also like",
              style: Styles.textStyle14.copyWith(fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(height: 8),
          const SimilarBooksListView(),
        ],
      ),
    );
  }
}
