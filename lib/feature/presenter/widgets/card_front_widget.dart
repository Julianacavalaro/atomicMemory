import 'dart:math';

import 'package:atomic_memory/feature/domain/model/card_model.dart';
import 'package:atomic_memory/feature/presenter/widgets/description_card_element_widget.dart';
import 'package:flutter/material.dart';

class CardFrontWidget extends StatelessWidget {
  final CardModel atomicElement;
  const CardFrontWidget({super.key, required this.atomicElement});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          const EdgeInsets.only(left: 15.0, right: 15.0, top: 10, bottom: 10),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        color: Color.fromARGB(249, 249, 173, 1),
      ),
      child: Transform(
        transform: Matrix4.rotationY(pi),
        alignment: Alignment.center,
        child: DescriptionCardFrontWidget(atomicElement: atomicElement),
      ),
    );
  }
  //construtor com parametros, atributos
}
