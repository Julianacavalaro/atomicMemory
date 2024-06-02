import 'package:atomic_memory/presenter/widgets/card_back_widget.dart';
import 'package:atomic_memory/presenter/widgets/card_front_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:atomic_memory/presenter/widgets/card_game_widget.dart';

void main() {
  testWidgets('CardGameWidget flips correctly', (WidgetTester tester) async {
    // Build our CardGameWidget.
    await tester.pumpWidget(const MaterialApp(home: CardGameWidget()));

    // Verify that initial widget is CardBackWidget.
    expect(find.byType(CardBackWidget), findsOneWidget);
    expect(find.byType(CardFrontWidget), findsNothing);

    // Tap the widget to trigger flip.
    await tester.tap(find.byType(GestureDetector));
    await tester.pumpAndSettle(const Duration(seconds: 1) );

    // Verify that after tapping, widget is CardFrontWidget.
    expect(find.byType(CardFrontWidget), findsOneWidget);
    expect(find.byType(CardBackWidget), findsNothing);
  });

}
