import 'package:flutter/material.dart';

class DescriptionCardElementWidget extends StatelessWidget {
  const DescriptionCardElementWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(children: [
              Text(
                '3',
                style: TextStyle(
                  fontSize: 10,
                  fontFamily: 'Poppins-SemiBold',
                  color: Colors.black,
                ),
              ),
            ]),
            Column(children: [
              Text(
                '6.9410',
                style: TextStyle(
                  fontSize: 10,
                  fontFamily: 'Poppins-SemiBold',
                  color: Colors.black,
                ),
              ),
            ]),
          ],
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            'Li',
            style: TextStyle(
              fontSize: 70,
              fontFamily: 'Poppins-SemiBold',
              color: Colors.black,
            ),
          ),
        ]),
        Row(mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
         children: [
          Text(
            'Lithium',
            style: TextStyle(
              fontSize: 10,
              fontFamily: 'Poppins-SemiBold',
              color: Colors.black,
            ),
          ),
        ],
        ),
      ],
    );
  }
}
