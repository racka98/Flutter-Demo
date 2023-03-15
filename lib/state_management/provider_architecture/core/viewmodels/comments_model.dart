import 'package:flutter_demo/state_management/provider_architecture/core/enums/view_state.dart';
import 'package:flutter_demo/state_management/provider_architecture/core/models/comment.dart';
import 'package:flutter_demo/state_management/provider_architecture/core/services/api.dart';
import 'package:flutter_demo/state_management/provider_architecture/locator.dart';
import 'package:flutter_demo/state_management/provider_architecture/provider/ui_notifier.dart';

class CommentsModel extends UiNotifier {
  final _api = locator<Api>();

  List<Comment> comments = [];

  Future fetchComments(int postId) async {
    setState(ViewState.Busy);
    comments = await _api.getCommentsForPost(postId);
    setState(ViewState.Idle);
  }
}
