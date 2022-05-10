import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rick_and_morty_riverpod/dependencies.dart';
import 'package:rick_and_morty_riverpod/src/domain/entities/character_entity.dart';
import 'package:rick_and_morty_riverpod/src/domain/entities/character_search_entity.dart';
import 'package:rick_and_morty_riverpod/src/domain/entities/episode_entity.dart';

final pageFilterPod = StateProvider.autoDispose<int>((_) => 1);
final searchFilterPod = StateProvider.autoDispose<String>((_) => '');
final idsFilterPod = StateProvider.autoDispose<List<String>>((_) => []);
final genderFilterPod =
    StateProvider.autoDispose<CharacterSearchDataFormGender>(
        (_) => CharacterSearchDataFormGender.all);

final characterDataPod = FutureProvider.family
    .autoDispose<List<CharacterEntity>, CharacterSearchData>(
  (ref, data) async {
    final page = ref.watch(pageFilterPod);
    final filter = ref.watch(searchFilterPod).toLowerCase();
    final gender = ref.watch(genderFilterPod);
    final ids = ref.watch(idsFilterPod);
    return ref
        .watch(characterRepositoryPod)
        .getCharacterList(CharacterSearchData(
          page: page,
          gender: gender,
          search: filter,
          characterIds: ids
        ));
  },
);

final characterInterestingDataPod =
    FutureProvider.family.autoDispose<List<CharacterEntity>, List<String>>(
  (ref, characters) async {
    return ref
        .watch(characterRepositoryPod)
        .getCharacterInterestingList(characters);
  },
);


final characterDetailDataPod =
    FutureProvider.family.autoDispose<CharacterEntity, String>(
  (ref, characterId) async {
    return ref.watch(characterRepositoryPod).getCharacter(characterId);
  },
);

final episodeDataPod =
    FutureProvider.family.autoDispose<List<EpisodeEntity>, List<String>>(
  (ref, episodes) async {
    return ref.watch(episodeRepositoryPod).getEpisodeList(episodes);
  },
);

final favoriteLocalPod = FutureProvider<List<String>?>(
  (ref) async => ref.watch(preferencesRepositoryPod).getFavorites(),
);


