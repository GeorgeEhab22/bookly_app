import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/features/home/use_cases/fetch_features_books_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.fetchFeaturedBooksUseCase)
      : super(FeaturedBooksInitial()) {
    fetchFeaturedBooks();
  }

  final FetchFeaturedBooksUseCase fetchFeaturedBooksUseCase;

  int _pageNumber = 0;
  bool _isLoadingMore = false;

  Future<void> fetchFeaturedBooks({bool isLoadMore = false}) async {
    if (isLoadMore && _isLoadingMore) return; 
    if (isLoadMore) _isLoadingMore = true;

    if (!isLoadMore) {
      emit(FeaturedBooksLoading());
    }

    final result = await fetchFeaturedBooksUseCase.call(_pageNumber);

    result.fold(
      (failure) {
        if(_pageNumber > 0){
          emit(FeaturedBooksPaginationFailure(failure.message));
          _isLoadingMore = false;
          return;
        }
        emit(FeaturedBooksFailure(failure.message));
      },
      (books) {
        if (isLoadMore && (state is FeaturedBooksSuccess || state is FeaturedBooksPaginationFailure)) {
          final currentBooks = (state as FeaturedBooksSuccess).books;
          final updatedBooks = List<BookEntity>.from(currentBooks)..addAll(books);
          emit(FeaturedBooksSuccess(updatedBooks));
        } else {
          emit(FeaturedBooksSuccess(books));
        }
        _pageNumber++;
      },
    );

    _isLoadingMore = false;
  }
}
