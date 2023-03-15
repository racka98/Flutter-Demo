import 'package:flutter/material.dart';
import 'package:flutter_demo/we_rate_dogs/dog_model.dart';

class DogCard extends StatefulWidget {
  const DogCard({Key? key, required this.dog}) : super(key: key);

  final Dog dog;

  @override
  State<DogCard> createState() => _DogCardState();
}

class _DogCardState extends State<DogCard> {
  String? _renderUrl;

  @override
  void initState() {
    super.initState();
    _renderDogPic();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        height: 115.0,
        child: Stack(
          children: [
            Positioned(
              left: 50.0,
              child: _dogCard,
            ),
            Positioned(child: _dogImage),
          ],
        ),
      ),
    );
  }

  Widget get _dogImage => Container(
        height: 100.0,
        width: 100.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(_renderUrl ?? ""),
          ),
        ),
      );

  Widget get _dogCard => SizedBox(
        width: 290,
        height: 125,
        child: Card(
          color: Colors.black87,
          child: Padding(
            padding: const EdgeInsets.only(
              top: 8.0,
              bottom: 8.0,
              left: 64.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  widget.dog.name,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Text(
                  widget.dog.location,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Row(
                  children: [
                    const Icon(Icons.star),
                    Text(": ${widget.dog.rating} / 10"),
                  ],
                )
              ],
            ),
          ),
        ),
      );

  void _renderDogPic() async {
    await widget.dog.getImageUrl();
    if (mounted) {
      setState(() {
        _renderUrl = widget.dog.imageUrl;
      });
    }
  }
}
