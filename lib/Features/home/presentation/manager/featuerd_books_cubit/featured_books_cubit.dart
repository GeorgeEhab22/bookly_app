import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/features/home/use_cases/fetch_features_books_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.fetchFeaturedBooksUseCase) : super(FeaturedBooksInitial()) {
    fetchFeaturedBooks();
  }

  final FetchFeaturedBooksUseCase fetchFeaturedBooksUseCase;  
  Future<void> fetchFeaturedBooks() async {
    emit(FeaturedBooksLoading());
    var result = await fetchFeaturedBooksUseCase.call();
    result.fold((failure) => emit(FeaturedBooksFailure(failure.message)), (books) {
      emit(FeaturedBooksSuccess(books));
    });
  }
}
