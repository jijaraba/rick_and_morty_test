import 'package:rick_and_morty_riverpod/src/data/models/character_model.dart';
import 'package:rick_and_morty_riverpod/src/data/models/episode_model.dart';
import 'package:rick_and_morty_riverpod/src/data/models/location_model.dart';
import 'package:rick_and_morty_riverpod/src/data/models/origin_model.dart';
import 'package:rick_and_morty_riverpod/src/domain/entities/character_entity.dart';
import 'package:rick_and_morty_riverpod/src/domain/entities/episode_entity.dart';
import 'package:rick_and_morty_riverpod/src/domain/entities/location_entity.dart';
import 'package:rick_and_morty_riverpod/src/domain/entities/origin_entity.dart';

extension ToCharacterModelX on CharacterModel {
  CharacterEntity toCharacterEntity() {
    return CharacterEntity(
      id: id,
      name: name,
      status: status,
      species: species,
      type: type,
      gender: gender,
      origin: origin.toOriginEntity(),
      location: location.toLocationEntity(),
      image: image,
      episode: episode,
      url: url,
    );
  }
}

extension ToEpisodeModelX on EpisodeModel {
  EpisodeEntity toEpisodeEntity() {
    return EpisodeEntity(
      id: id,
      name: name,
      airDate: airDate,
      episode: episode,
      characters: characters,
      url: url,
    );
  }
}

extension ToOriginModelX on OriginModel {
  OriginEntity toOriginEntity() => OriginEntity(
        name: name,
        url: url,
      );
}

extension ToLocationModelX on LocationModel {
  LocationEntity toLocationEntity() => LocationEntity(
        name: name,
        url: url,
      );
}
