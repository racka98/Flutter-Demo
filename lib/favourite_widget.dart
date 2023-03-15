import 'package:flutter/material.dart';

class FavouriteWidget extends StatefulWidget {
  const FavouriteWidget({Key? key}) : super(key: key);

  @override
  State<FavouriteWidget> createState() => _FavouriteWidgetState();
}

class _FavouriteWidgetState extends State<FavouriteWidget> {
  bool _isFavourite = true;
  int _favouriteCount = 41;

  void _toggleFavourite() {
    setState(() {
      if (_isFavourite) {
        _favouriteCount -= 1;
        _isFavourite = false;
      } else {
        _favouriteCount += 1;
        _isFavourite = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(0),
          child: IconButton(
            padding: const EdgeInsets.all(0),
            alignment: Alignment.centerRight,
            onPressed: _toggleFavourite,
            icon: _isFavourite
                ? const Icon(Icons.star)
                : const Icon(Icons.star_border),
            color: Colors.red[500],
          ),
        ),
        SizedBox(
          width: 18,
          child: SizedBox(
            child: Text('$_favouriteCount'),
          ),
        )
      ],
    );
  }
}
