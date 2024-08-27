import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

import '../../domain/model/card_model.dart';

class DescriptionCardFrontWidget extends StatelessWidget {
  final CardModel atomicElement;
  const DescriptionCardFrontWidget({super.key, required this.atomicElement});

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      fontSize: 10,
      fontFamily: 'Poppins-SemiBold',
      color: Colors.black,
    );
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 1,
                child: Text(
                  atomicElement.atomicNumber,
                  maxLines: 1,
                  style: textStyle,
                ),
              ),
              Flexible(
                flex: 1,
                child: Text(
                  atomicElement.atomicMass,
                  maxLines: 1,
                  style: textStyle,
                ),
              ),
            ],
          ),
          Flexible(
            flex: 4,
            child: AutoSizeText(
              atomicElement.atomicSymbol,
              style: const TextStyle(
                fontSize: 100,
                fontFamily: 'Poppins-SemiBold',
                color: Colors.black,
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Text(
              atomicElement.atomicName,
              style: textStyle,
            ),
          ),
        ]);
  }
}
