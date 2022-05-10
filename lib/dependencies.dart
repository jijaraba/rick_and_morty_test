import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rick_and_morty_riverpod/src/config/app_config.dart';
import 'package:rick_and_morty_riverpod/src/data/repositories/character_repository.dart';
import 'package:rick_and_morty_riverpod/src/data/repositories/episode_repository.dart';
import 'package:rick_and_morty_riverpod/src/data/repositories/preferences_repository.dart';
import 'package:rick_and_morty_riverpod/src/data/services/character_service.dart';
import 'package:rick_and_morty_riverpod/src/data/services/episode_service.dart';
import 'package:rick_and_morty_riverpod/src/data/services/preferences_service.dart';
import 'package:rick_and_morty_riverpod/src/domain/repositories/i_character_repository.dart';
import 'package:rick_and_morty_riverpod/src/domain/repositories/i_episode_reposity.dart';
import 'package:rick_and_morty_riverpod/src/domain/repositories/i_preferences_repository.dart';
import 'package:rick_and_morty_riverpod/src/interceptors/logging_interceptor.dart';
import 'package:rick_and_morty_riverpod/src/presentation/viewmodels/preferences/preferences_state.dart';
import 'package:rick_and_morty_riverpod/src/presentation/viewmodels/preferences/preferences_viewmodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

//region Data source layer
final dioClientPod = Provider<Dio>(
  (ref) {
    return Dio(
      BaseOptions(
        baseUrl: ref.watch(appConfigPod).serverBaseUrl,
        connectTimeout: 15000,
      ),
    )..interceptors.add(LoggingInterceptor());
  },
  dependencies: [appConfigPod],
);

final preferencesPod = FutureProvider<SharedPreferences>(
  (_) => SharedPreferences.getInstance(),
);
//endregion

//region Service layer
final preferencesServicePod = Provider<PreferencesService>(
  (ref) {
    final sharedPreferencesData = ref.watch(preferencesPod).asData!;
    return PreferencesServiceImpl(sharedPreferencesData.value);
  },
  dependencies: [preferencesPod],
);
//endregion

//region Repository layer

final characterRepositoryPod = Provider<ICharacterRepository>(
  (ref) => CharacterRepository(CharacterServiceImpl(ref.watch(dioClientPod))),
  dependencies: [dioClientPod],
);

final episodeRepositoryPod = Provider<IEpisodeRepository>(
  (ref) => EpisodeRepository(EpisodeServiceImpl(ref.watch(dioClientPod))),
  dependencies: [dioClientPod],
);

final preferencesRepositoryPod = Provider<IPreferencesRepository>(
  (ref) => PreferencesRepository(ref.watch(preferencesServicePod)),
  dependencies: [preferencesServicePod],
);

//endregion

//region ViewModel layer
final preferencesViewModelPod =
StateNotifierProvider<PreferencesViewModel, PreferencesState>(
      (ref) => PreferencesViewModel(ref.watch(preferencesRepositoryPod)),
  dependencies: [preferencesRepositoryPod],
);
//endregion

//region App Config
final appConfigPod = Provider<AppConfig>(
  (_) => throw UnimplementedError('appConfigPod must be overridden'),
);
//endregion
