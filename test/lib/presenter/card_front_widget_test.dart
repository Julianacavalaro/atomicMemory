import 'dart:math';

import 'package:atomic_memory/presenter/widgets/card_front_widget.dart';
import 'package:atomic_memory/presenter/widgets/description_card_element_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'card_front_widget_finders.dart';

void main() {
  CardFrontWidgetFinders finders = CardFrontWidgetFinders();
  group('CardFrontWidget', () {
    testWidgets('Verifica o layout do card_front', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: CardFrontWidget(),
      ));

      expect(find.byType(Container), findsOneWidget);

      expect(find.byType(DescriptionCardFrontWidget), findsOneWidget);

      expect(finders.transformRotationY, findsOneWidget);
    });
  });
}
