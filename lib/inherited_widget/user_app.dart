import 'package:flutter/material.dart';
import 'package:flutter_demo/inherited_widget/state_container.dart';

class InheritedWidgetApp extends StatelessWidget {
  const InheritedWidgetApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const StateContainer(child: UserApp());
  }
}


class UserApp extends StatelessWidget {
  const UserApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "InheritedWidget Usage",
      theme: ThemeData(primarySwatch: Colors.cyan),
      home: const HomeScreen(),
    );
  }
}

// Stateful Widget that hold the app state
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  User? user;

  Widget get _userInfo => Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "${user?.firstName} ${user?.lastName}",
          style: const TextStyle(fontSize: 24.0),
        ),
        Text(
          user?.email ?? "None",
          style: const TextStyle(fontSize: 24.0),
        )
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    // This is how you access your store. This container
    // is where your properties and methods live
    final container = StateContainer.of(context);
    // set the user
    user = container.user;

    var body = user != null ? _userInfo : _loginPrompt;
    return Scaffold(
      appBar: AppBar(
        title: const Text("InheritedWidget Usage"),
      ),
      body: body,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _updateUser(context),
        child: const Icon(Icons.edit),
      ),
    );
  }

  Widget get _loginPrompt => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Text(
              "Please Add User Information",
              style: TextStyle(fontSize: 18.0),
            )
          ],
        ),
      );

  // All this method does is bring up the form page.
  void _updateUser(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          fullscreenDialog: true,
          builder: (context) => const UpdateUserScreen(),
        ));
  }
}

class UpdateUserScreen extends StatelessWidget {
  static final GlobalKey<FormState> formKey = GlobalKey();
  static final GlobalKey<FormFieldState<String>> firstNameKey = GlobalKey();
  static final GlobalKey<FormFieldState<String>> lastNameKey = GlobalKey();
  static final GlobalKey<FormFieldState<String>> emailKey = GlobalKey();

  const UpdateUserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final container = StateContainer.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Edit User Info")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
            key: formKey,
          autovalidateMode: AutovalidateMode.disabled,
          child: ListView(
            children: [
              TextFormField(
                key: firstNameKey,
                style: Theme.of(context).textTheme.headlineMedium,
                decoration: const InputDecoration(
                  hintText: "First Name",
                ),
              ),
              TextFormField(
                key: lastNameKey,
                style: Theme.of(context).textTheme.headlineMedium,
                decoration: const InputDecoration(
                  hintText: "Last Name",
                ),
              ),
              TextFormField(
                key: emailKey,
                style: Theme.of(context).textTheme.headlineMedium,
                decoration: const InputDecoration(
                  hintText: "Email Address",
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          final form = formKey.currentState;
          if (form?.validate() ?? false) {
            final firstName = firstNameKey.currentState?.value;
            final lastName = lastNameKey.currentState?.value;
            final email = lastNameKey.currentState?.value;

            container.updateUserInfo(
              firstName: firstName == "" ? null : firstName,
              lastName: lastName == "" ? null : lastName,
              email: email == "" ? null : email,
            );
            Navigator.pop(context);
          }
        },
      ),
    );
  }
}
