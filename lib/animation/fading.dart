import 'package:flutter/material.dart';
import 'package:flutter_demo/animation/animated_container.dart';

class AnimationApp extends StatelessWidget {
  const AnimationApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Animations",
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      //home: const FadeAnimation(title: "Fade Animation"),
      home: const AnimatedContainerExample(),
    );
  }
}

class FadeAnimation extends StatefulWidget {
  const FadeAnimation({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<FadeAnimation> createState() => _FadeAnimationState();
}

class _FadeAnimationState extends State<FadeAnimation> {
  bool _isVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _isVisible = !_isVisible;
          });
        },
        tooltip: "Toggle Opacity",
        child: const Icon(Icons.flip),
      ),
      body: Center(
        child: AnimatedOpacity(
          opacity: _isVisible ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 500),
          child: Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
