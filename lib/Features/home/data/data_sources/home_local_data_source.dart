import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';

abstract class HomeLocalDataSource {
  List<BookModel> fetchNewsetBooks();
  List<BookModel> fetchFeaturedBooks();
}
class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  @override
  List<BookModel> fetchFeaturedBooks() {
    throw UnimplementedError();  
  }

  @override 
  List<BookModel> fetchNewsetBooks() {
    throw UnimplementedError();
  }
}