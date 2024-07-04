import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BarBoardWidget extends StatefulWidget {
  const BarBoardWidget({super.key});

  @override
  State<BarBoardWidget> createState() => _BarBoardWidgetState();
}

class _BarBoardWidgetState extends State<BarBoardWidget> {
  Stopwatch contadorJuliana = Stopwatch();

  String _printDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60).abs());
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60).abs());
    return "$twoDigitMinutes:$twoDigitSeconds";
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    contadorJuliana.start();
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      currentSeconds++;
      //  print(_printDuration(contadorJuliana.elapsed));
      setState(() {});
    });
  }

  @override
  void dispose() {
    timer!.cancel();
    contadorJuliana.stop();
    super.dispose();
  }

  Timer? timer;
  int currentSeconds = 0;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 0, top: 5, right: 5, bottom: 10),
                    child: SvgPicture.asset('images/microscopio.svg'),
                  ),
                  onTap: () {
                    print('Clicou no microscópio');
                  },
                ),
                GestureDetector(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 5, top: 5, right: 5, bottom: 10),
                    child:
                        SvgPicture.asset('images/atomo_verso.svg', height: 42),
                  ),
                  onTap: () => print('Clicou no átomo'),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    height: 30,
                    width: 60,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      color: Color.fromARGB(255, 246, 246, 246),
                    ),
                    child: Text(_printDuration(contadorJuliana.elapsed),
                        // maxLines: 1,
                        style: const TextStyle(
                          fontSize: 15,
                          fontFamily: 'Poppins-SemiBold',
                          color: Colors.blueGrey,
                        ))),
                const Text("Tempo",
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 10,
                      fontFamily: 'Poppins-SemiBold',
                      color: Colors.black,
                    )),
              ],
            ),
            const Column(children: [
              Text(
                'Tentativas:',
                maxLines: 1,
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'Poppins-SemiBold',
                  color: Colors.black,
                ),
              ),
              Text(
                'Erros:',
                maxLines: 1,
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'Poppins-SemiBold',
                  color: Colors.black,
                ),
              ),
            ]),
          ]),
    );
  }
}
