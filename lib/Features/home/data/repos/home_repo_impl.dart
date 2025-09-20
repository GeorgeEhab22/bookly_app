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
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks() async {
    print('🔍 fetchFeaturedBooks: Starting...');
    try {
      List<BookEntity> books = [];
      
      print('📱 fetchFeaturedBooks: Checking local data source...');
      books = localDataSource.fetchFeaturedBooks();
      print('📱 fetchFeaturedBooks: Local books count: ${books.length}');
      
      if (books.isNotEmpty) {
        print('✅ fetchFeaturedBooks: Returning local books');
        return right(books);
      }
      
      print('🌐 fetchFeaturedBooks: Local empty, fetching from remote...');
      books = await remoteDataSource.fetchFeaturedBooks();
      print('✅ fetchFeaturedBooks: Remote books count: ${books.length}');
      
      return right(books);
    } catch (e) {
      print('❌ fetchFeaturedBooks: Exception caught: $e');
      print('❌ fetchFeaturedBooks: Exception type: ${e.runtimeType}');
      
      if(e is DioException){
        print('❌ fetchFeaturedBooks: DioException details:');
        print('   - Type: ${e.type}');
        print('   - Message: ${e.message}');
        print('   - Response: ${e.response?.data}');
        print('   - Status Code: ${e.response?.statusCode}');
        return Left(ServerFailure.fromDioError(e));
      }
      print('❌ fetchFeaturedBooks: Non-Dio exception');
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks() async {
    print('🔍 fetchNewestBooks: Starting...');
    try {
      List<BookEntity> books = [];
      
      print('📱 fetchNewestBooks: Checking local data source...');
      books = localDataSource.fetchNewestBooks();
      print('📱 fetchNewestBooks: Local books count: ${books.length}');
      
      if (books.isNotEmpty) {
        print('✅ fetchNewestBooks: Returning local books');
        return right(books);
      }
      
      print('🌐 fetchNewestBooks: Local empty, fetching from remote...');
      books = await remoteDataSource.fetchNewestBooks();
      print('✅ fetchNewestBooks: Remote books count: ${books.length}');
      
      return right(books);
    } catch (e) {
      print('❌ fetchNewestBooks: Exception caught: $e');
      print('❌ fetchNewestBooks: Exception type: ${e.runtimeType}');
      
      if(e is DioException){
        print('❌ fetchNewestBooks: DioException details:');
        print('   - Type: ${e.type}');
        print('   - Message: ${e.message}');
        print('   - Response: ${e.response?.data}');
        print('   - Status Code: ${e.response?.statusCode}');
        return Left(ServerFailure.fromDioError(e));
      }
      print('❌ fetchNewestBooks: Non-Dio exception');
      return Left(ServerFailure(e.toString()));
    }
  }
}