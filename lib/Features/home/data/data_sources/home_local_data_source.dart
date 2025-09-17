import 'package:bookly_app/constants.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:hive/hive.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> fetchNewsetBooks();
  List<BookEntity> fetchFeaturedBooks();
}

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  @override
  List<BookEntity> fetchFeaturedBooks() {
    var box = Hive.box<BookEntity>(kFeaturedBooks);
    return box.values.toList();
  }

  
@override
  List<BookEntity> fetchNewsetBooks() {
    var box = Hive.box<BookEntity>(kNewestBooks);
    return box.values.toList();
  }
}
