import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class CardBackWidgetFinders {
        Finder containerPadding = find.byWidgetPredicate((Widget widget) =>
            widget is Container &&
            widget.padding == const EdgeInsets.all(25.0));

        Finder containerDecoration = find.byWidgetPredicate(
          (Widget widget) =>
              widget is Container &&
              widget.decoration ==
                  const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      gradient:
                          LinearGradient(end: Alignment.bottomLeft, colors: [
                        Color.fromARGB(242, 242, 242, 242),
                        Color.fromARGB(245, 215, 214, 214),
                      ])),
        );
}