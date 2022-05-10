import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rick_and_morty_riverpod/src/core/res/res.dart';

class FavoriteWidget extends ConsumerStatefulWidget {
  final VoidCallback? onPressed;
  final bool isFavorite;

  const FavoriteWidget({
    Key? key,
    required this.onPressed,
    this.isFavorite = false,
  }) : super(key: key);

  @override
  ConsumerState<FavoriteWidget> createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends ConsumerState<FavoriteWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: UIColors.grey50,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Icon(
          Icons.star,
          color: widget.isFavorite ? UIColors.yellow : UIColors.grey200,
        ),
      ),
    );
  }
}
