
import 'package:dio/dio.dart';
import 'package:rick_and_morty_riverpod/src/data/models/episode_model.dart';

abstract class EpisodeService {
  Future<List<EpisodeModel>?> getEpisodeList(List<String> episodes);
}

class EpisodeServiceImpl implements EpisodeService {
  EpisodeServiceImpl(this._client);

  final Dio _client;

  @override
  Future<List<EpisodeModel>?> getEpisodeList(List<String> episodes) async {
    try {
      final response = await _client.get(
        '/episode/${episodes}',
      );
      if (response.statusCode == 200) {
        return (response.data! as List)
            .map((x) => EpisodeModel.fromJson(x))
            .toList();
      }
      return null;
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }

}
