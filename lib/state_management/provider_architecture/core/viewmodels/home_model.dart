import 'package:flutter_demo/state_management/provider_architecture/core/enums/view_state.dart';
import 'package:flutter_demo/state_management/provider_architecture/core/models/post.dart';
import 'package:flutter_demo/state_management/provider_architecture/core/services/api.dart';
import 'package:flutter_demo/state_management/provider_architecture/locator.dart';
import 'package:flutter_demo/state_management/provider_architecture/provider/ui_notifier.dart';

class HomeModel extends UiNotifier {
  final _api = locator<Api>();

  List<Post> posts = [];

  Future getPosts(int userId) async {
    setState(ViewState.Busy);
    posts = await _api.getPostsForUser(userId);
    setState(ViewState.Idle);
  }
}
