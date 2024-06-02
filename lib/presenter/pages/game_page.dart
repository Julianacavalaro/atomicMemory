import 'package:atomic_memory/presenter/widgets/card_game_widget.dart';

import 'package:flutter/material.dart';

class GamePage extends StatelessWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 32, 153, 193),
              Color.fromARGB(245, 105, 188, 218),
            ],
          ),
        ),
        child: GridView.count(
          crossAxisCount: 3,
          childAspectRatio: 0.75,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.all(10.0),
          children: List.generate(12, (int index) => const CardGameWidget(),
              growable: true),
        ),
      ),
    );
    //);
  }
}
