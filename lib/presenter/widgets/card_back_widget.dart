import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardBackWidget extends StatelessWidget {
  const CardBackWidget({super.key});


  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        child: Container(
          padding: const EdgeInsets.all (25),
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              gradient: LinearGradient(end: Alignment.bottomLeft, colors: [
            Color.fromARGB(242, 242, 242, 242),
            Color.fromARGB(245, 215, 214, 214),
          ])),
          child: SvgPicture.asset('images/atomo_verso.svg'),
        ),
      );
  }
}
