import 'package:bookly_app/features/home/presentation/views/home_view.dart';
import 'package:bookly_app/features/splash/presentation/Views/splash_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
static const String home = '/homeView';
static final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: AppRouter.home,
      builder: (context, state) => const HomeView(),
    ),
  ],
);

}
