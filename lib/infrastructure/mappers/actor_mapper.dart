import 'package:flutter_application_cinemapedia/domain/entities/actor.dart';

import '../models/movidedb/credits_response.dart';

class ActorMapper {
  static Actor castToEntity(Cast cast) => Actor(
        id: cast.id,
        name: cast.name,
        profilePath: cast.profilePath != null
            ? 'https://image.tmdb.org/t/p/w500${cast.profilePath}'
            : 'https://pbs.twimg.com/profile_images/1408052285221990400/tousn1_R_400x400.jpg',
        character: cast.character,
      );
}
