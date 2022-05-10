import 'package:dio/dio.dart';
import 'package:rick_and_morty_riverpod/src/data/models/character_model.dart';
import 'package:rick_and_morty_riverpod/src/domain/entities/character_search_entity.dart';

abstract class CharacterService {
  Future<List<CharacterModel>?> getCharacterList(CharacterSearchData data);

  Future<List<CharacterModel>?> getCharacterInterestingList(
      List<String> characters);

  Future<CharacterModel?> getCharacter(String characterId);
}

class CharacterServiceImpl implements CharacterService {
  CharacterServiceImpl(this._client);

  final Dio _client;

  @override
  Future<List<CharacterModel>?> getCharacterList(
      CharacterSearchData data) async {
    try {
      final response = await _client.get(
        '/character/${data.toQueryParam()}',
      );
      if (response.statusCode == 200) {
        if (data.characterIds!.isEmpty) {
          return (response.data['results']! as List)
              .map((x) => CharacterModel.fromJson(x))
              .toList();
        } else {
          return (response.data! as List)
              .map((x) => CharacterModel.fromJson(x))
              .toList();
        }
      }
      return null;
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }

  @override
  Future<List<CharacterModel>?> getCharacterInterestingList(
      List<String> characters) async {
    try {
      final response = await _client.get(
        '/character/${characters}',
      );
      if (response.statusCode == 200) {
        return (response.data! as List)
            .map((x) => CharacterModel.fromJson(x))
            .toList();
      }
      return null;
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }

  @override
  Future<CharacterModel?> getCharacter(String characterId) async {
    try {
      final response = await _client.get(
        '/character/${characterId}',
      );
      if (response.statusCode == 200) {
        return CharacterModel.fromJson(response.data!);
      }
      return null;
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }
}
