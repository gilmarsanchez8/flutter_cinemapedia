import 'package:dio/dio.dart';
import 'package:flutter_application_cinemapedia/domain/datasources/actors_datasource.dart';
import 'package:flutter_application_cinemapedia/domain/entities/actor.dart';
import 'package:flutter_application_cinemapedia/infrastructure/mappers/actor_mapper.dart';
import 'package:flutter_application_cinemapedia/infrastructure/models/movidedb/credits_response.dart';

import '../../config/constants/enviroment.dart';

class ActorMoviedbDatasource extends ActorsDatasource {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3/',
      queryParameters: {
        'api_key': Enviroment.movieDbKey,
        'language': 'es-CO',
      },
    ),
  );

  @override
  Future<List<Actor>> getActorsByMovie(String movieId) async {
    final response = await dio.get('movie/$movieId/credits');
    final castResponse = CreditsResponse.fromJson(response.data);
    List<Actor> actors = castResponse.cast
        .map((cast) => ActorMapper.castToEntity(cast))
        .toList();
    return actors;
  }
}
