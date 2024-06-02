import 'dart:math';

import 'package:atomic_memory/presenter/widgets/card_back_widget.dart';
import 'package:atomic_memory/presenter/widgets/card_front_widget.dart';
import 'package:flutter/material.dart';

class CardGameWidget extends StatefulWidget {
  const CardGameWidget({super.key});

  @override
  State<CardGameWidget> createState() => _CardGameWidgetState();
}

class _CardGameWidgetState extends State<CardGameWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController animation;

  @override
  void initState() {
    super.initState();
    animation = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
  }

  @override
  void dispose() {
    animation.dispose();
    super.dispose();
  }

  flipCard() {
    animation.forward();
  }

  getCardAtom(double angulo) {
    if (angulo > 0.5 * pi) {
      return const CardFrontWidget();
    } else {
      return const CardBackWidget();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: animation,
        builder: (BuildContext context, _) {
          final angulo = animation.value * pi;
          final transform = Matrix4.identity()
            ..setEntry(3, 2, 0.0002)
            ..rotateY(angulo);

          return GestureDetector(
            onTap: () => flipCard(),
            child: Transform(
                transform: transform,
                alignment: Alignment.center,
                child: Card(
                  margin: const EdgeInsetsDirectional.all(0),
                  elevation: 4,
                  child: getCardAtom(angulo),
                )),
          );
        });
  }
}
