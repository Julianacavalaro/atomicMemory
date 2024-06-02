import 'dart:math';

import 'package:atomic_memory/presenter/widgets/card_front_widget.dart';
import 'package:atomic_memory/presenter/widgets/description_card_element_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('CardFrontWidget UI Test', (WidgetTester tester) async {
    // Build our CardFrontWidget.
    await tester.pumpWidget(const MaterialApp(
      home: CardFrontWidget(),
    ));

    // Verify that the CardFrontWidget has a Container.
    expect(find.byType(Container), findsOneWidget);

    // Verify that the Container has correct padding.
    expect(
        tester.widget<Container>(find.byType(Container)).padding,
        const EdgeInsets.only(
          left: 15.0,
          right: 15.0,
          top: 10,
          bottom: 10,
        ));

    // Verify that the Container has correct BoxDecoration.
    final containerDecoration = tester
        .widget<Container>(find.byType(Container))
        .decoration as BoxDecoration;
    expect(containerDecoration.borderRadius,
        BorderRadius.circular(8)); // Check if border radius is 8
    expect(containerDecoration.color,
        const Color.fromARGB(249, 249, 173, 1)); // Check if color is correct

    // Verify that the CardFrontWidget has a Transform.
    expect(find.byType(Transform), findsOneWidget);

    // Verify that the Transform has correct properties.
    final transformWidget = tester.widget<Transform>(find.byType(Transform));
    expect(transformWidget.transform, Matrix4.rotationY(pi)); // Check rotation
    expect(transformWidget.alignment, Alignment.center); // Check alignment

    // Verify that the CardFrontWidget has a DescriptionCardFrontWidget.
    expect(find.byType(DescriptionCardFrontWidget), findsOneWidget);
  });
}
