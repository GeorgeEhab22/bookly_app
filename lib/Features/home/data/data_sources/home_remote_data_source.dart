import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookModel>> fetchNewsetBooks();
  Future<List<BookModel>> fetchFeaturedBooks();
  Future<List<BookModel>> fetchSimilarBooks({required String category});
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  @override

  @override
  Future<List<BookModel>> fetchFeaturedBooks() {
    throw UnimplementedError();
  }

  @override
  Future<List<BookModel>> fetchSimilarBooks({required String category}) {
    throw UnimplementedError();
  }
  
  @override
  Future<List<BookModel>> fetchNewsetBooks() {
    throw UnimplementedError();
  }
}
