import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utils/api_service.dart';
import 'package:bookly_app/core/utils/functions.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchNewsetBooks();
  Future<List<BookEntity>> fetchFeaturedBooks();
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService apiService;
  HomeRemoteDataSourceImpl(this.apiService);
  @override
  Future<List<BookEntity>> fetchFeaturedBooks() async{
     var data = await apiService.get(endpoint: 'volumes?Filtering=free-ebooks&q=programming');
     List<BookEntity> books = getBooksList(data);
     saveBoxData(books,kFeaturedBooks);
     return books;
  }


 

  @override
  Future<List<BookEntity>> fetchNewsetBooks() async{
    var data = await apiService.get(endpoint: 'volumes?Filtering=-ebooks&Sorting=newest&q=programming');
     List<BookEntity> books = getBooksList(data);
    saveBoxData(books,kNewestBooks);
     return books;
  }
}

 List<BookEntity> getBooksList(Map<String, dynamic> data) {
    List<BookEntity> books = [];
    for(var book in data['items']){
      books.add(BookModel.fromJson(book));
    }
    return books;
  }