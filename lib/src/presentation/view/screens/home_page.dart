import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rick_and_morty_riverpod/src/core/forms/character/character_form_state_notifier.dart';
import 'package:rick_and_morty_riverpod/src/core/hooks/curved_animation_hook.dart';
import 'package:rick_and_morty_riverpod/src/core/presentation/theme/theme.dart';
import 'package:rick_and_morty_riverpod/src/core/presentation/viewmodels/common_viewmodel_provider.dart';
import 'package:rick_and_morty_riverpod/src/core/presentation/widgets/custom_text_field.dart';
import 'package:rick_and_morty_riverpod/src/core/presentation/widgets/error_container.dart';
import 'package:rick_and_morty_riverpod/src/core/presentation/widgets/shiny_icon_button.dart';
import 'package:rick_and_morty_riverpod/src/core/presentation/widgets/widgets.dart';
import 'package:rick_and_morty_riverpod/src/core/res/res.dart';
import 'package:rick_and_morty_riverpod/src/core/utils/common_extensions.dart';
import 'package:rick_and_morty_riverpod/src/domain/entities/character_entity.dart';
import 'package:rick_and_morty_riverpod/src/domain/entities/character_search_entity.dart';
import 'package:rick_and_morty_riverpod/src/presentation/view/widgets/character_item.dart';
import 'package:rick_and_morty_riverpod/src/presentation/view/widgets/favorite_widget.dart';

class HomePage extends StatefulHookConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    final localization = context.localizations;

    final characterData = ref.watch(characterDataPod(
      CharacterSearchData(
        page: ref.read(pageFilterPod),
        search: ref.read(searchFilterPod),
        gender: ref.read(genderFilterPod),
      ),
    ));
    return Scaffold(
      body: RefreshIndicator(
        color: UIColors.green100,
        onRefresh: () async => ref.refresh(characterDataPod(
          CharacterSearchData(
            page: ref.read(pageFilterPod),
            search: ref.read(searchFilterPod),
            gender: ref.read(genderFilterPod),
          ),
        )),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ///Header
              _CharacterDetailHeader(),

              ///Favorite
              _CharacterFavorite(),

              ///Characters
              Container(
                child: characterData.when(
                  data: (data) => _CharacterList(
                    characterList: data,
                  ),
                  loading: () => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  error: (e, s) => ErrorContainer(
                    text: localization.text('common.genericError'),
                    subtitle: localization.text('common.genericErrorSubtitle'),
                    onRetryPress: () => ref.refresh(characterDataPod(
                      CharacterSearchData(
                        page: ref.read(pageFilterPod),
                        search: ref.read(searchFilterPod),
                        gender: ref.read(genderFilterPod),
                      ),
                    )),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CharacterDetailHeader extends StatefulHookConsumerWidget {
  const _CharacterDetailHeader({
    Key? key,
  }) : super(key: key);

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
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Column(
            children: <Widget>[
              Image.asset(
                Assets.background,
                fit: BoxFit.cover,
                height: 200,
                width: MediaQuery.of(context).size.width,
              ),
              Container(
                height: 100,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 0),
                decoration: BoxDecoration(
                  color: UIColors.darkBlue,
                ),
                child: Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Expanded(child: _SearchTextField()),
                        HSpacing(40),
                        Container(
                          margin: EdgeInsets.only(top: 5),
                          child: PopupMenuButton<CharacterSearchDataFormGender>(
                            initialValue: CharacterSearchDataFormGender.all,
                            onSelected: (newGender) => ref
                                .read(genderFilterPod.notifier)
                                .state = newGender,
                            shape: RoundedRectangleBorder(
                              borderRadius: borderRadiusSmall,
                            ),
                            child: ShinyIconButton(
                              icon: Icons.menu,
                              height: 50,
                              width: 50,
                            ),
                            color: UIColors.darkBlue,
                            itemBuilder: (_) =>
                                CharacterSearchDataFormGender.values
                                    .map(
                                      (value) => PopupMenuItem<
                                          CharacterSearchDataFormGender>(
                                        value: value,
                                        child: PopOption(value: value),
                                      ),
                                    )
                                    .toList(),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned.fill(
            top: 40,
            child: Align(
              alignment: Alignment.topCenter,
              child: AspectRatio(
                aspectRatio: 2.5 / 1.1,
                child: ScaleTransition(
                  scale: animation,
                  child: Image.asset(
                    Assets.rickAndMortyLogo,
                    width: 300,
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

class PopOption extends StatelessWidget {
  const PopOption({Key? key, required this.value}) : super(key: key);

  final CharacterSearchDataFormGender value;

  static final mapTitle = {
    CharacterSearchDataFormGender.all: 'Todos',
    CharacterSearchDataFormGender.unknown: 'Unknown',
    CharacterSearchDataFormGender.female: 'Female',
    CharacterSearchDataFormGender.male: 'Male',
    CharacterSearchDataFormGender.genderless: 'Genderless',
  };

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            mapTitle[value] ?? '',
            style: textNormal.copyWith(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const HSpacing.regular(),
          Icon(
            Icons.menu,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}

class _SearchTextField extends HookConsumerWidget {
  const _SearchTextField({Key? key, this.value}) : super(key: key);

  final String? value;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localization = context.localizations;

    final characterText = ref.watch(
      characterNotifierPod.select((form) => form.search),
    );
    final characterTextController = useTextEditingController(
      text: characterText.value.isNotEmpty ? characterText.value : value,
    );

    useEffect(
      () {
        if (value != null) {
          Future.microtask(() {
            ref.read(characterNotifierPod.notifier).changeSearch(value!);
          });
        }
        return null;
      },
      [value],
    );

    return CustomTextField(
      padding: EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 6,
      ),
      maxLength: 100,
      textController: characterTextController,
      requiredMessage: localization.text('addressRequiredLabel'),
      inputType: TextInputType.streetAddress,
      action: TextInputAction.next,
      onChange: (value) => ref.read(searchFilterPod.notifier).state = value,
      isRequired: true,
      prefix: Icon(
        Icons.search,
        color: UIColors.white,
      ),
      textColor: UIColors.white,
      focusedColor: UIColors.white,
      hintColor: UIColors.white,
      borderColor: UIColors.white,
      backgroundColor: UIColors.darkBlue,
    );
  }
}

class _CharacterFavorite extends ConsumerStatefulWidget {
  const _CharacterFavorite({Key? key}) : super(key: key);

  @override
  ConsumerState<_CharacterFavorite> createState() => _CharacterFavoriteState();
}

class _CharacterFavoriteState extends ConsumerState<_CharacterFavorite> {
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final localization = context.localizations;
    final favoriteData = ref.watch(favoriteLocalPod);

    return Container(
      margin: EdgeInsets.symmetric(vertical: 30),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: <Widget>[
          Text(
            localization.text('common.showFavorites'),
            style: textNormal.copyWith(color: UIColors.black),
          ),
          HSpacing(10),
          FavoriteWidget(
            isFavorite: isFavorite,
            onPressed: () {
              setState(() {
                isFavorite = !isFavorite;
              });
              ref.read(idsFilterPod.notifier).state =
                  (isFavorite ? favoriteData.value : [])!;
            },
          )
        ],
      ),
    );
  }
}

class _CharacterList extends ConsumerWidget {
  const _CharacterList({
    Key? key,
    required this.characterList,
  }) : super(key: key);

  final List<CharacterEntity> characterList;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteData = ref.watch(favoriteLocalPod);
    final localization = context.localizations;

    return characterList.isEmpty
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[Text("TODO")],
          )
        : favoriteData.when(
            data: (data) {
              return ListView(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: <Widget>[
                  for (final item in characterList)
                    CharacterItem(
                      character: item,
                      isFavorite:
                          data!.contains(item.id.toString()) ? true : false,
                    ),
                ],
              );
            },
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
            error: (e, s) => ErrorContainer(
              text: localization.text('common.genericError'),
              subtitle: localization.text('common.genericErrorSubtitle'),
              onRetryPress: () => ref.refresh(
                characterDataPod(
                  CharacterSearchData(
                    page: ref.read(pageFilterPod),
                    search: ref.read(searchFilterPod),
                    gender: ref.read(genderFilterPod),
                  ),
                ),
              ),
            ),
          );
  }
}
