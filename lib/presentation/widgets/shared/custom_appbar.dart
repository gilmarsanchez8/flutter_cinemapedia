import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_application_cinemapedia/presentation/delegates/search_movie_delegate.dart';
import 'package:flutter_application_cinemapedia/presentation/providers/providers.dart';
import 'package:go_router/go_router.dart';

import '../../../domain/entities/movie.dart';

class CustomAppbar extends ConsumerWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).colorScheme;
    final titleStyle = Theme.of(context).textTheme.titleMedium;
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: SizedBox(
          width: double.infinity,
          child: Row(
            children: [
              Icon(
                Icons.movie_outlined,
                color: colors.primary,
              ),
              SizedBox(width: 5),
              Text(
                'Cinemapedia',
                style: titleStyle,
              ),
              Spacer(),
              IconButton(
                onPressed: () {
                  final movieRepository = ref.read(movieRepositoryProvider);
                  final searchQuery = ref.read(searchQueryProvider);
                  showSearch<Movie?>(
                    query: searchQuery,
                    context: context,
                    delegate: SearchMovieDelegate(
                      searchMovies: (query) {
                        ref
                            .read(searchQueryProvider.notifier)
                            .update((state) => query);
                        return movieRepository.searchMovies(query);
                      },
                    ),
                  ).then((movie) {
                    if (movie == null) return;
                    context.push('/movie/${movie.id}');
                  });
                },
                icon: Icon(Icons.search),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
