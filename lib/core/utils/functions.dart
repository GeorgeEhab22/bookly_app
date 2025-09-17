
  import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:hive/hive.dart';

void saveBoxData(List<BookModel> books,String boxName) {
    var box= Hive.box(boxName);
    box.addAll(books);
  }