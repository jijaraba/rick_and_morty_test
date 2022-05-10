import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rick_and_morty_riverpod/src/core/forms/character/character_form_state_notifier.dart';
import 'package:rick_and_morty_riverpod/src/core/presentation/theme/theme.dart';
import 'package:rick_and_morty_riverpod/src/core/presentation/viewmodels/common_viewmodel_provider.dart';
import 'package:rick_and_morty_riverpod/src/core/presentation/widgets/custom_button.dart';
import 'package:rick_and_morty_riverpod/src/core/presentation/widgets/widgets.dart';
import 'package:rick_and_morty_riverpod/src/core/res/res.dart';
import 'package:rick_and_morty_riverpod/src/core/utils/common_extensions.dart';
import 'package:rick_and_morty_riverpod/src/domain/entities/character_search_entity.dart';

class ErrorContainer extends ConsumerWidget {
  const ErrorContainer({
    Key? key,
    required this.text,
    this.subtitle,
    this.textColor = Colors.black,
    this.onRetryPress,
  }) : super(key: key);

  final String text;
  final String? subtitle;
  final Color textColor;
  final VoidCallback? onRetryPress;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localization = context.localizations;
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Column(
              children: [
                Text(
                  text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    color: textColor,
                  ),
                ),
                VSpacing(20),
                if (subtitle != null)
                  Text(
                    subtitle!,
                    textAlign: TextAlign.center,
                    style: textNormal.copyWith(color: UIColors.black),
                  ),
                VSpacing(20),
                CustomButton(
                  paddingHorizontal: 90,
                  onPressed: () {
                    ref.read(searchFilterPod.notifier).state = '';
                    ref.read(characterNotifierPod.notifier).changeSearch('');
                    ref.read(genderFilterPod.notifier).state = CharacterSearchDataFormGender.all;
                    ref.read(pageFilterPod.notifier).state = 1;
                  },
                  text: localization.text('common.removeFilters'),
                  textColor: UIColors.white,
                )
              ],
            ),
          ),
          IconButton(
            onPressed: onRetryPress,
            icon: const Icon(Icons.refresh, size: 28),
          ),
        ],
      ),
    );
  }
}
