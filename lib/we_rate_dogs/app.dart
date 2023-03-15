import 'package:flutter/material.dart';
import 'package:flutter_demo/we_rate_dogs/dog_card.dart';

import 'dog_model.dart';

class DogsApp extends StatelessWidget {
  const DogsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "We Rate Dogs",
      theme: ThemeData(brightness: Brightness.dark),
      home: const AppHomePage(title: "We Rate Dogs"),
    );
  }
}

class AppHomePage extends StatefulWidget {
  const AppHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<AppHomePage> createState() => _AppHomePageState();
}

class _AppHomePageState extends State<AppHomePage> {
  List<Dog> initialDoggos = [
    Dog(
        name: 'Ruby',
        location: 'Portland, OR, USA',
        description:
            'Ruby is a very good girl. Yes: Fetch, loungin\'. No: Dogs who get on furniture.'),
    Dog(
        name: 'Rex',
        location: 'Seattle, WA, USA',
        description: 'Best in Show 1999'),
    Dog(
        name: 'Rod Stewart',
        location: 'Prague, CZ',
        description: 'Star good boy on international snooze team.'),
    Dog(
        name: 'Herbert',
        location: 'Dallas, TX, USA',
        description: 'A Very Good Boy'),
    Dog(
        name: 'Buddy',
        location: 'North Pole, Earth',
        description: 'Self proclaimed human lover.'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.black87,
      ),
      body: DogCard(dog: initialDoggos[1]),
    );
  }
}
