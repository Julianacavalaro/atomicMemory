import 'dart:math';

import 'package:atomic_memory/presenter/widgets/description_card_element_widget.dart';
import 'package:flutter/material.dart';

class CardChemicalElementWidget extends StatelessWidget {
  const CardChemicalElementWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      child: Material(
        shadowColor: Colors.black,
        elevation: 4.0,
        child: Container(
            padding: const EdgeInsets.only(
                left: 15.0, right: 15.0, top: 10, bottom: 10),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              color: Color.fromARGB(249, 249, 173, 1),

            ),
            child: Transform(
              transform: Matrix4.rotationY(pi),
              alignment: Alignment.center,
              child:  const DescriptionCardElementWidget(), 

            ),
      ),
    ));
  }
}
