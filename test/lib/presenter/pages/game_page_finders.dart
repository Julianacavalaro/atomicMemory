import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class GamePageFinders {
  Finder backgroundColor = find.byWidgetPredicate(
    (Widget widget) =>
        widget is Container &&
        widget.decoration ==
            const BoxDecoration(
              gradient: LinearGradient(
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(255, 32, 153, 193),
                  Color.fromARGB(245, 105, 188, 218),
                ],
              ),
            ),
  );
}
