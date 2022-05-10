import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rick_and_morty_riverpod/src/core/hooks/curved_animation_hook.dart';
import 'package:rick_and_morty_riverpod/src/core/presentation/theme/theme.dart';
import 'package:rick_and_morty_riverpod/src/core/presentation/viewmodels/common_viewmodel_provider.dart';
import 'package:rick_and_morty_riverpod/src/core/presentation/widgets/error_container.dart';
import 'package:rick_and_morty_riverpod/src/core/presentation/widgets/widgets.dart';
import 'package:rick_and_morty_riverpod/src/core/res/res.dart';
import 'package:rick_and_morty_riverpod/src/core/utils/common_extensions.dart';
import 'package:rick_and_morty_riverpod/src/domain/entities/character_entity.dart';
import 'package:rick_and_morty_riverpod/src/presentation/view/widgets/card_episode_widget.dart';
import 'package:rick_and_morty_riverpod/src/presentation/view/widgets/card_info_widget.dart';
import 'package:rick_and_morty_riverpod/src/presentation/view/widgets/character_item.dart';

class CharacterDetailPage extends StatefulHookConsumerWidget {
  const CharacterDetailPage({
    Key? key,
    required this.characterId,
  }) : super(key: key);

  final String characterId;

  @override
  ConsumerState<CharacterDetailPage> createState() =>
      _CharacterDetailPageState();
}

class _CharacterDetailPageState extends ConsumerState<CharacterDetailPage> {
  @override
  Widget build(BuildContext context) {
    final localization = context.localizations;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final characterData = ref.watch(characterDetailDataPod(widget.characterId));
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: colorScheme.onSurface),
        leading: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 10,
          ),
          child: GestureDetector(
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: UIColors.green100.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Icon(
                Icons.arrow_back,
                color: UIColors.white,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: characterData.when(
          data: (data) => Container(
            child: Column(
              children: <Widget>[
                ///Header
                _CharacterDetailHeader(character: data),

                ///Info
                _CharacterDetailInfo(character: data),

                ///Episodes
                _CharacterDetailEpisodes(
                  episodesIds: data.getEpisodesIds,
                ),

                ///Interesting Character
                _CharacterInterestingList(episodes: ["1", "3", "5"]),
              ],
            ),
          ),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
          error: (e, s) => ErrorContainer(
            text: localization.text('common.genericError'),
            onRetryPress: () => ref.refresh(
              characterDetailDataPod(widget.characterId),
            ),
          ),
        ),
      ),
    );
  }
}

class _CharacterDetailHeader extends StatefulHookConsumerWidget {
  final CharacterEntity character;

  const _CharacterDetailHeader({Key? key, required this.character})
      : super(key: key);

  @override
  ConsumerState<_CharacterDetailHeader> createState() =>
      _CharacterDetailHeaderState();
}

class _CharacterDetailHeaderState
    extends ConsumerState<_CharacterDetailHeader> {
  @override
  Widget build(BuildContext context) {
    final animationController = useAnimationController(
      duration: const Duration(seconds: 1),
    );
    final animation = useCurvedAnimation(
      animationController,
      curve: Curves.bounceInOut,
    );

    useMemoized(() => Future<void>(animationController.forward));

    return Container(
      child: Stack(
        children: [
          Column(
            children: <Widget>[
              Image.asset(
                Assets.backgroundDetail,
                fit: BoxFit.cover,
                height: 200,
              ),
              Container(
                height: 150,
                decoration: BoxDecoration(
                  color: UIColors.darkBlue,
                ),
              ),
            ],
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: Container(
                width: 120,
                height: 120,
                padding: EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: UIColors.white,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: AspectRatio(
                  aspectRatio: 2.5 / 1.1,
                  child: ScaleTransition(
                    scale: animation,
                    child: ClipOval(
                      child: CachedNetworkImage(
                        width: 150,
                        height: 150,
                        imageUrl: widget.character.image,
                        fit: BoxFit.fill,
                        errorWidget: (_, __, ___) => const Icon(
                          Icons.restaurant,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            child: Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 0, top: 15),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: widget.character.status == 'Alive'
                                  ? UIColors.green
                                  : Colors.red,
                            ),
                          ),
                          HSpacing(5),
                          Text(
                            widget.character.status.toUpperCase(),
                            style: textSmall,
                          ),
                        ],
                      ),
                      VSpacing(10),
                      Text(
                        widget.character.name,
                        overflow: TextOverflow.ellipsis,
                        style: textNormal.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      VSpacing(10),
                      Text(
                        widget.character.species.toUpperCase(),
                        style: textSmall,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CharacterDetailInfo extends StatelessWidget {
  final CharacterEntity character;

  const _CharacterDetailInfo({Key? key, required this.character})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localization = context.localizations;

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 30,
            ),
            child: Text(
              localization.text("common.information"),
              style: textNormal.copyWith(
                color: UIColors.grey300,
              ),
            ),
          ),
          GridView.count(
            padding: EdgeInsets.symmetric(vertical: 0),
            shrinkWrap: true,
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            childAspectRatio: 100 / 45,
            crossAxisSpacing: 10,
            physics: const ClampingScrollPhysics(),
            children: <Widget>[
              CardInfoWidget(
                title: localization.text("common.gender"),
                value: character.gender,
              ),
              CardInfoWidget(
                title: localization.text("common.origin"),
                value: character.origin.name,
              ),
              CardInfoWidget(
                title: localization.text("common.type"),
                value: character.type == '' ? 'unknown' : character.type,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _CharacterDetailEpisodes extends ConsumerWidget {
  final List<String> episodesIds;

  const _CharacterDetailEpisodes({Key? key, required this.episodesIds})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localization = context.localizations;

    final episodeData = ref.watch(episodeDataPod(episodesIds));

    return episodeData.when(
      data: (data) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 30,
                ),
                child: Text(
                  localization.text("common.episodes"),
                  style: textNormal.copyWith(
                    color: UIColors.grey300,
                  ),
                ),
              ),
              Column(
                children: [
                  GridView.count(
                    padding: EdgeInsets.symmetric(vertical: 0),
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    childAspectRatio: 2,
                    crossAxisSpacing: 10,
                    physics: const ClampingScrollPhysics(),
                    children: <Widget>[
                      for (final episode in data)
                        CardEpisodeWidget(
                          title: episode.name,
                          value: episode.episode,
                          date: episode.airDate,
                        ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
      },
      loading: () => SizedBox(
        height: MediaQuery.of(context).size.height * .6,
        width: MediaQuery.of(context).size.width,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
      error: (e, _) => SizedBox(
        height: MediaQuery.of(context).size.height * .75,
        width: MediaQuery.of(context).size.width,
        child: ErrorContainer(
          text: localization.text('genericError'),
          onRetryPress: () => ref.refresh(
            episodeDataPod(episodesIds),
          ),
        ),
      ),
    );
  }
}

class _CharacterInterestingList extends ConsumerWidget {
  final List<String> episodes;

  const _CharacterInterestingList({Key? key, required this.episodes})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localization = context.localizations;

    final characterData = ref.watch(
      characterInterestingDataPod(episodes),
    );

    return characterData.when(
      data: (data) => Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 30,
              ),
              child: Text(
                localization.text("common.characterInteresting"),
                style: textNormal.copyWith(
                  color: UIColors.grey300,
                ),
              ),
            ),
            ListView(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              shrinkWrap: true,
              children: <Widget>[
                for (final item in data) CharacterItem(character: item),
              ],
            ),
          ],
        ),
      ),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      error: (e, s) => ErrorContainer(
        text: localization.text('common.genericError'),
        onRetryPress: () => ref.refresh(characterInterestingDataPod(episodes)),
      ),
    );
  }
}
