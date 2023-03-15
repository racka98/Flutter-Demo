import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const albumUrl = "https://jsonplaceholder.typicode.com/albums/1";

class Album {
  final int userId;
  final int id;
  final String title;

  Album({required this.userId, required this.id, required this.title});

  factory Album.fromJson(Map<String, dynamic> json) =>
      Album(
        userId: json['userId'],
        id: json['id'],
        title: json['title'],
      );
}

class NetworkAlbumApp extends StatelessWidget {
  const NetworkAlbumApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Network Album",
      theme: ThemeData(primarySwatch: Colors.brown),
      home: Scaffold(
        appBar: AppBar(title: const Text("Network Album")),
        body: const AlbumData(),
      ),
    );
  }
}

class AlbumData extends StatefulWidget {
  const AlbumData({Key? key}) : super(key: key);

  @override
  State<AlbumData> createState() => _AlbumDataState();
}

class _AlbumDataState extends State<AlbumData> {
  late Future<Album> album;

  @override
  void initState() {
    super.initState();
    album = _fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder<Album>(
          future: album,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data!.title);
            } else if(snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }

  Future<Album> _fetchAlbum() async {
    final response = await http.get(Uri.parse(albumUrl));
    if (response.statusCode == 200) {
      return Album.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to Load Album");
    }
  }
}


