import 'package:rick_and_morty_riverpod/src/core/presentation/viewmodels/model_extensions.dart';
import 'package:rick_and_morty_riverpod/src/data/services/character_service.dart';
import 'package:rick_and_morty_riverpod/src/domain/entities/character_entity.dart';
import 'package:rick_and_morty_riverpod/src/domain/entities/character_search_entity.dart';
import 'package:rick_and_morty_riverpod/src/domain/repositories/i_character_repository.dart';

class CharacterRepository implements ICharacterRepository {
  CharacterRepository(this._characterService);

  final CharacterService _characterService;

  @override
  Future<List<CharacterEntity>> getCharacterList(
      CharacterSearchData data) async {
    final characterModel = await _characterService.getCharacterList(data);
    return characterModel!.map((item) => item.toCharacterEntity()).toList();
  }

  @override
  Future<List<CharacterEntity>> getCharacterInterestingList(List<String> characters) async {
    final characterModel = await _characterService.getCharacterInterestingList(characters);
    return characterModel!.map((item) => item.toCharacterEntity()).toList();
  }

  @override
  Future<CharacterEntity> getCharacter(characterId) async {
    final characterModel = await _characterService.getCharacter(characterId);
    return characterModel!.toCharacterEntity();
  }


}
