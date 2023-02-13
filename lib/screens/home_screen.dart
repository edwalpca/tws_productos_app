import 'package:flutter/material.dart';

import '../widgets/widgets_export.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Productos'),
      ),
      body: Center(
        //
        //
        //
        child: ListView.builder(
            //
            //
            itemBuilder: (BuildContext context, int index) {
              //
              //
              //
              return const ProductCard();
              //
              //
        }),
      ),
      floatingActionButton:
          FloatingActionButton(child: const Icon(Icons.add), onPressed: () {}),
    );
  }
}
