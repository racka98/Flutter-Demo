import 'package:flutter/material.dart';
import 'package:flutter_demo/state_management/provider_architecture/locator.dart';
import 'package:flutter_demo/state_management/provider_architecture/provider/ui_notifier.dart';
import 'package:provider/provider.dart';

class UiNotifierConsumer<T extends UiNotifier> extends StatefulWidget {
  final Widget Function(BuildContext context, T model, Widget? child) builder;
  final Function(T)? onModelReady;

  const UiNotifierConsumer({
    Key? key,
    required this.builder,
    this.onModelReady,
  }) : super(key: key);

  @override
  State<UiNotifierConsumer<T>> createState() => _UiNotifierConsumerState<T>();
}

class _UiNotifierConsumerState<T extends UiNotifier>
    extends State<UiNotifierConsumer<T>> {
  T model = locator<T>();

  @override
  void initState() {
    if (widget.onModelReady != null) {
      widget.onModelReady!(model);
    }
    super.initState();
  }

  @override
  void dispose() {
    model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      create: (context) => model,
      child: Consumer<T>(
        builder: widget.builder,
      ),
    );
  }
}
