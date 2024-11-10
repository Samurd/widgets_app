import 'package:go_router/go_router.dart';
import 'package:widgets_app/presentation/screens/screens.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: "/",
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: "/buttons",
      builder: (context, state) => const ButtonsScreen(),
    ),
    GoRoute(
      path: "/snackbar",
      builder: (context, state) => const SnackbarScreen(),
    ),
    GoRoute(
      path: "/tutorial",
      builder: (context, state) => const AppTutorialScreen(),
    ),
    GoRoute(
      path: "/infinite",
      builder: (context, state) => const InfiniteScrollScreen(),
    ),
    GoRoute(
      path: "/counter",
      builder: (context, state) => const CounterScreen(),
    ),

        GoRoute(
      path: "/theme-changer",
      builder: (context, state) => const ThemeChangerScreen(),
    ),
  ],
);
