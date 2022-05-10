import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:rick_and_morty_riverpod/src/core/presentation/theme/theme.dart';
import 'package:rick_and_morty_riverpod/src/core/presentation/widgets/custom_button.dart';
import 'package:rick_and_morty_riverpod/src/core/presentation/widgets/widgets.dart';
import 'package:rick_and_morty_riverpod/src/core/res/res.dart';
import 'package:rick_and_morty_riverpod/src/core/utils/common_extensions.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localization = context.localizations;
    return SplashScaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 24,
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const VSpacing(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      Assets.logoS,
                      scale: 1.2,
                    ),
                    HSpacing(10),
                    SvgPicture.asset(
                      Assets.logoWhite,
                      height: 15,
                    ),
                  ],
                ),
                const VSpacing(5),
                Image.asset(Assets.rickAndMortyLogo),
                const VSpacing(10),
                Text(
                  localization.text("common.welcome"),
                  style: h1,
                  textAlign: TextAlign.center,
                ),
                const VSpacing(30),
                Text(
                  localization.text("common.welcome_content"),
                  style: textNormal,
                  textAlign: TextAlign.center,
                ),
                const VSpacing(80),
                CustomButton(
                  onPressed: () {
                    context.go('/home');
                  },
                  text: "Continuar",
                  textColor: UIColors.white,
                  paddingHorizontal: 60,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
