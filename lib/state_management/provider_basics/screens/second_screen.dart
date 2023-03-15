import 'package:flutter/material.dart';
import 'package:flutter_demo/state_management/provider_basics/providers/counter_provider.dart';
import 'package:flutter_demo/state_management/provider_basics/providers/shopping_cart_provider.dart';
import 'package:provider/provider.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider Example App (${context.watch<Counter>().count})'),
      ),
      body: Center(
        child: ListView(
          children: [
            Center(
              child: Text(
                '${context.watch<ShoppingCart>().count}',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            for (String item in context.watch<ShoppingCart>().cart)
              Center(child: Text(item)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        key: const Key('addItem_floatingActionButton'),
        onPressed: () => context.read<ShoppingCart>().addItem('Bread'),
        tooltip: 'Add Item',
        child: const Icon(Icons.add),
      ),
    );
  }
}
