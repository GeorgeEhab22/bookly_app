import 'package:bookly_app/core/errors/failure.dart';
import 'package:bookly_app/features/home/data/data_sources/home_local_data_source.dart';
import 'package:bookly_app/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/features/home/domain/repositories/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl extends HomeRepo {
  final HomeRemoteDataSource remoteDataSource;
  final HomeLocalDataSource localDataSource;
  HomeRepoImpl({required this.remoteDataSource, required this.localDataSource});
  
  @override
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks({int pageNumber = 0}) async {
    try {
      List<BookEntity> books = [];
      
      books = localDataSource.fetchFeaturedBooks();
      
      if (books.isNotEmpty) {
        return right(books);
      }
      
      books = await remoteDataSource.fetchFeaturedBooks();
      
      return right(books);
    } catch (e) {
      
      if(e is DioException){
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks() async {
    try {
      List<BookEntity> books = [];
      
      books = localDataSource.fetchNewestBooks();
      
      if (books.isNotEmpty) {
        return right(books);
      }
      
      books = await remoteDataSource.fetchNewestBooks();
      
      return right(books);
    } catch (e) {
      
      if(e is DioException){
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}