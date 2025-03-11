import 'package:flutter_application_cinemapedia/presentation/views/home_views/favorites_view.dart';
import 'package:go_router/go_router.dart';
import '../../presentation/screens/screens.dart';
import '../../presentation/views/home_views/home_view.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return HomeScreen(childView: child);
      },
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) {
            return HomeView();
          },
          routes: [
            GoRoute(
              path: 'movie/:id',
              name: MovieScreen.name,
              builder: (context, state) {
                final movieId = state.pathParameters['id'] ?? 'No ID';
                return MovieScreen(
                  movieId: movieId,
                );
              },
            ),
          ],
        ),
        GoRoute(
          path: '/favorites',
          builder: (context, state) {
            return FavoritesView();
          },
        ),
      ],
    ),
    // Routes parent-child
    // GoRoute(
    //   path: '/',
    //   name: HomeScreen.name,
    //   builder: (context, state) => HomeScreen(childView: HomeView()),
    //   routes: [
    //     GoRoute(
    //       path: 'movie/:id',
    //       name: MovieScreen.name,
    //       builder: (context, state) {
    //         final movieId = state.pathParameters['id'] ?? 'No ID';
    //         return MovieScreen(
    //           movieId: movieId,
    //         );
    //       },
    //     ),
    //   ],
    // ),
  ],
);
