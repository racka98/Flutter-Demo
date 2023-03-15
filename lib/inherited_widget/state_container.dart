import 'package:flutter/material.dart';

class User {
  String firstName;
  String lastName;
  String email;

  User({required this.firstName, required this.lastName, required this.email});
}

class StateContainer extends StatefulWidget {
  final Widget child;
  final User? user;

  const StateContainer({
    Key? key,
    this.user,
    required this.child,
  }) : super(key: key);

  // This is the secret sauce. Write your own 'of' method that will behave
  // Exactly like MediaQuery.of and Theme.of
  // It basically says 'get the data from the widget of this type.
  static StateContainerState of(BuildContext context) {
    /*return (context
                .dependOnInheritedWidgetOfExactType<_InheritedStateContainer>()
            as _InheritedStateContainer)
        .data;*/

    final _InheritedStateContainer? result =
        context.dependOnInheritedWidgetOfExactType<_InheritedStateContainer>();
    assert(result != null, 'No _InheritedStateContainer found in context');
    return result!.data;
  }

  @override
  State<StateContainer> createState() => StateContainerState();
}

class StateContainerState extends State<StateContainer> {
  // Whichever properties you wanna pass around your app as state
  User? user;

  // You can (and probably will) have methods on your StateContainer
  // These methods are then used through our your app to
  // change state.
  // Using setState() here tells Flutter to repaint all the
  // Widgets in the app that rely on the state you've changed.
  void updateUserInfo({
    String? firstName,
    String? lastName,
    String? email,
  }) {
    if (user == null) {
      setState(() {
        user = User(
          firstName: firstName ?? "",
          lastName: lastName ?? "",
          email: email ?? "",
        );
      });
    } else {
      setState(() {
        user!.firstName = firstName ?? user!.firstName;
        user!.lastName = lastName ?? user!.lastName;
        user!.email = email ?? user!.email;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return _InheritedStateContainer(data: this, child: widget.child);
  }
}

class _InheritedStateContainer extends InheritedWidget {
  // Data is your entire state. In our case just 'User'
  final StateContainerState data;

  const _InheritedStateContainer({
    Key? key,
    required this.data,
    required Widget child,
  }) : super(key: key, child: child);

  /*static _InheritedStateContainer of(BuildContext context) {
    final _InheritedStateContainer? result =
        context.dependOnInheritedWidgetOfExactType<_InheritedStateContainer>();
    assert(result != null, 'No _InheritedStateContainer found in context');
    return result!;
  }*/

  // This is a built in method which you can use to check if
  // any state has changed. If not, no reason to rebuild all the widgets
  // that rely on your state.
  @override
  bool updateShouldNotify(_InheritedStateContainer old) => true;
}
