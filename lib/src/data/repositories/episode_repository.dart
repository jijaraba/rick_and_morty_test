import 'package:rick_and_morty_riverpod/src/core/presentation/viewmodels/model_extensions.dart';
import 'package:rick_and_morty_riverpod/src/data/services/episode_service.dart';
import 'package:rick_and_morty_riverpod/src/domain/entities/episode_entity.dart';
import 'package:rick_and_morty_riverpod/src/domain/repositories/i_episode_reposity.dart';

class EpisodeRepository implements IEpisodeRepository {
  EpisodeRepository(this._episodeService);

  final EpisodeService _episodeService;

  @override
  Future<List<EpisodeEntity>> getEpisodeList(List<String> episode) async {
    final episodeModel = await _episodeService.getEpisodeList(episode);
    return episodeModel!.map((item) => item.toEpisodeEntity()).toList();
  }
}
