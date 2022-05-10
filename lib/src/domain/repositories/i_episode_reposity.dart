
import 'package:rick_and_morty_riverpod/src/domain/entities/episode_entity.dart';

abstract class IEpisodeRepository {
  Future<List<EpisodeEntity>> getEpisodeList(List<String> episodes);
}
