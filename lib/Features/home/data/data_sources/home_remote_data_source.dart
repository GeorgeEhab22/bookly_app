import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utils/api_service.dart';
import 'package:bookly_app/core/utils/functions/save_books.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeaturedBooks({int pageNumber = 0});
  Future<List<BookEntity>> fetchNewestBooks();
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService apiService;
  HomeRemoteDataSourceImpl(this.apiService);

  @override
  Future<List<BookEntity>> fetchFeaturedBooks({int pageNumber = 0}) async {
    final data = await apiService.get(
      endPoint:
          'volumes?Filtering=free-ebooks&q=programming&startIndex=${pageNumber * 10}&maxResults=10',
    );

    final books = _getBooksList(data);
    saveBooksData(books, kFeaturedBooks); 
    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks() async {
    final data = await apiService.get(
      endPoint:
          'volumes?Filtering=free-ebooks&Sorting=newest&q=programming&maxResults=10',
    );

    final books = _getBooksList(data);
    saveBooksData(books, kNewestBooks);
    return books;
  }

  List<BookEntity> _getBooksList(Map<String, dynamic> data) {
    final items = data["items"] as List;
    return items.map((bookMap) => BookModel.fromJson(bookMap)).toList();
  }
}
