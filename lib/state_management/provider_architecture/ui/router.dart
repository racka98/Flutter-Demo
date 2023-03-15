import 'package:flutter/material.dart';
import 'package:flutter_demo/state_management/provider_architecture/core/models/post.dart';
import 'package:flutter_demo/state_management/provider_architecture/ui/views/home_view.dart';
import 'package:flutter_demo/state_management/provider_architecture/ui/views/login_view.dart';
import 'package:flutter_demo/state_management/provider_architecture/ui/views/post_view.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (context) => const HomeView());
      case "/login":
        return MaterialPageRoute(builder: (context) => LoginView());
      case "/post":
        final post = settings.arguments as Post;
        return MaterialPageRoute(builder: (context) => PostView(post: post));
      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(
              child: Text("No route defined for ${settings.name}"),
            ),
          ),
        );
    }
  }
}
