import 'package:flutter/material.dart';
import 'package:rick_and_morty_riverpod/src/core/presentation/theme/theme.dart';
import 'package:rick_and_morty_riverpod/src/core/presentation/widgets/widgets.dart';
import 'package:rick_and_morty_riverpod/src/core/res/res.dart';

class CardEpisodeWidget extends StatelessWidget {
  final String title;
  final String value;
  final String date;

  const CardEpisodeWidget({
    Key? key,
    required this.title,
    required this.value,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 12,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: UIColors.black16,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            overflow: TextOverflow.ellipsis,
            style: textSmall.copyWith(
              color: UIColors.grey300,
            ),
          ),
          VSpacing(5),
          Text(
            value,
            overflow: TextOverflow.ellipsis,
            style: textNormal.copyWith(
              color: UIColors.black,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.start,
          ),
          VSpacing(10),
          Text(
            date.toUpperCase(),
            overflow: TextOverflow.ellipsis,
            style: textSmall.copyWith(
              color: UIColors.grey300,
            ),
            textAlign: TextAlign.start,
          )
        ],
      ),
    );
  }
}
