import 'package:flutter/material.dart';
import 'package:flutter_demo/state_management/provider_architecture/core/enums/view_state.dart';
import 'package:flutter_demo/state_management/provider_architecture/core/models/post.dart';
import 'package:flutter_demo/state_management/provider_architecture/core/models/user.dart';
import 'package:flutter_demo/state_management/provider_architecture/core/viewmodels/home_model.dart';
import 'package:flutter_demo/state_management/provider_architecture/provider/ui_notifier_consumer.dart';
import 'package:flutter_demo/state_management/provider_architecture/ui/shared/app_colors.dart'
    as colors;
import 'package:flutter_demo/state_management/provider_architecture/ui/shared/text_styles.dart';
import 'package:flutter_demo/state_management/provider_architecture/ui/shared/ui_helpers.dart';
import 'package:flutter_demo/state_management/provider_architecture/ui/widgets/postlist_item.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return UiNotifierConsumer<HomeModel>(
      onModelReady: (model) => model.getPosts(Provider.of<User>(context).id),
      builder: (context, model, child) => Scaffold(
        backgroundColor: colors.backgroundColor,
        body: model.state == ViewState.Busy
            ? const Center(child: CircularProgressIndicator())
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UIHelper.verticalSpaceLarge(),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(
                      "Welcome ${Provider.of<User>(context).name}",
                      style: headerStyle,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Text(
                      "Here are all your posts",
                      style: subHeaderStyle,
                    ),
                  ),
                  UIHelper.verticalSpaceSmall(),
                  Expanded(child: _getPostsUi(model.posts)),
                ],
              ),
      ),
    );
  }

  Widget _getPostsUi(List<Post> posts) => ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) => PostListItem(
          post: posts[index],
          onTap: () {
            Navigator.pushNamed(context, "/post", arguments: posts[index]);
          },
        ),
      );
}
