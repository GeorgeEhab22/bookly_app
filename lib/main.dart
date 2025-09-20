import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utils/functions/setup_service_locator.dart';
import 'package:bookly_app/core/utils/simple_bloc_observer.dart';
import 'package:bookly_app/features/home/data/repos/home_repo_impl.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/features/home/presentation/manager/featuerd_books_cubit/featured_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly_app/features/home/use_cases/fetch_features_books_use_case.dart';
import 'package:bookly_app/features/home/use_cases/fetch_newest_books_use_case.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';


void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(BookEntityAdapter());
  setupServiceLocator();
  await Hive.openBox<BookEntity>(kFeaturedBooks);
  await Hive.openBox<BookEntity>(kNewestBooks);
  Bloc.observer = SimpleBlocObserver();
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => const Bookly(), // Wrap your app
    ),
  );
}


class Bookly extends StatelessWidget {
  const Bookly({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            return FeaturedBooksCubit(FetchFeaturedBooksUseCase(getIt<HomeRepoImpl>()));
          },
        ),
        BlocProvider(
          create: (context) {
            return NewestBooksCubit(FetchNewestBooksUseCase(getIt<HomeRepoImpl>()));
          },
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme: GoogleFonts.montserratTextTheme(
            ThemeData.dark().textTheme,
          ),
        ),
        builder: DevicePreview.appBuilder,
        locale: DevicePreview.locale(context),
      ),
    );
  }
}
