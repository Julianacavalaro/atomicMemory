import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => {
              //vira carta
            },
        child:
        //criar classe privada p o container p o verso da carta
         Container(
          width: 95,
          height: 145,
           padding: const EdgeInsets.all(8.0),

           
          decoration: const BoxDecoration(
            
              borderRadius: BorderRadius.all(Radius.circular(8)),
              gradient: LinearGradient(end: Alignment.bottomLeft, colors: [
                Color.fromARGB(242, 242, 242, 242),
                Color.fromARGB(245, 215, 214, 214),
              ])),
         child:  SvgPicture.asset('images/nucleo_atomico.svg'),
        ));
  }
}
