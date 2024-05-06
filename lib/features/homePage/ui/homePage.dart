import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      appBar: AppBar(title: Text('PageView with Flip Card')),
      body: PageView.builder(
        itemCount: 10, // Number of pages
        itemBuilder: (context, index) {
          return FlipCard(
            direction: FlipDirection.HORIZONTAL, // Or FlipDirection.VERTICAL
            front: Card(
              elevation: 4.0,
              margin: EdgeInsets.all(8.0),
              child: Container(
                alignment: Alignment.center,
                child: Text('Front of Card $index'),
              ),
            ),
            back: Card(
              elevation: 4.0,
              margin: EdgeInsets.all(8.0),
              child: Container(
                alignment: Alignment.center,
                child: Text('Back of Card $index'),
              ),
            ),
          );
        },
      ),
    );
  }
}

