import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class CardFrontWidgetFinders {
   Finder transformRotationY = find.byWidgetPredicate((Widget widget) =>
          widget is Transform && widget.transform == Matrix4.rotationY(pi));
}