import 'package:bookly_app/core/utils/api_service.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookModel>> fetchNewsetBooks();
  Future<List<BookModel>> fetchFeaturedBooks();
  Future<List<BookModel>> fetchSimilarBooks({required String category});
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService apiService;
  HomeRemoteDataSourceImpl(this.apiService);
  @override
  Future<List<BookModel>> fetchFeaturedBooks() async{
     var data = await apiService.get(endpoint: 'volumes?Filtering=free-ebooks&q=programming');
     List<BookModel> books = getBooksList(data);
     return books;
  }

  List<BookModel> getBooksList(Map<String, dynamic> data) {
    List<BookModel> books = [];
    for(var book in data['items']){
      books.add(BookModel.fromJson(book));
    }
    return books;
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
