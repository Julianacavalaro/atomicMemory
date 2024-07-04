import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class DescriptionCardFrontWidget extends StatelessWidget {
  const DescriptionCardFrontWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 1,
                child: Text(
                  '3',
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 10,
                    fontFamily: 'Poppins-SemiBold',
                    color: Colors.black,
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Text(
                  '6.9410',
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 10,
                    fontFamily: 'Poppins-SemiBold',
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          Flexible(
            flex: 4,
            child: AutoSizeText(
              'Li',
              style: TextStyle(
                fontSize: 100,
                fontFamily: 'Poppins-SemiBold',
                color: Colors.black,
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Text(
              'Lithium',
              style: TextStyle(
                fontSize: 10,
                fontFamily: 'Poppins-SemiBold',
                color: Colors.black,
              ),
            ),
          ),
        ]);
  }
}
