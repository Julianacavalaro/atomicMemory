import 'package:atomic_memory/feature/presenter/widgets/card_back_widget.dart';
import 'package:atomic_memory/feature/presenter/widgets/card_front_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:atomic_memory/feature/presenter/widgets/card_game_widget.dart';

void main() {
  group('CardGameWidget', () {
    testWidgets('Verifica se CardBackWidget vira e mostra CardFrontWidget',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: CardGameWidget()));
      expect(find.byType(GestureDetector), findsOneWidget);
      expect(find.byType(CardFrontWidget), findsNothing);

      await tester.tap(find.byType(GestureDetector));
      await tester.pumpAndSettle(const Duration(milliseconds: 600));

      expect(find.byType(CardFrontWidget), findsOneWidget);
      expect(find.byType(CardBackWidget), findsNothing);

      await tester.tap(find.byType(GestureDetector));
      await tester.pumpAndSettle(const Duration(milliseconds: 600));

      expect(find.byType(GestureDetector), findsOneWidget);
      expect(find.byType(CardFrontWidget), findsNothing);
    });
  });
}
