import 'package:atomic_memory/presenter/widgets/card_back_widget.dart';
import 'package:atomic_memory/presenter/widgets/card_front_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:atomic_memory/presenter/widgets/card_game_widget.dart';

void main() {
  group('CardGameWidget', (){
  testWidgets('Verifica se CardBackWidget vira e mostra CardFrontWidget', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: CardGameWidget()));

    expect(find.byType(CardBackWidget), findsOneWidget);
    expect(find.byType(CardFrontWidget), findsNothing);

    await tester.tap(find.byType(GestureDetector));
    await tester.pumpAndSettle(const Duration(milliseconds: 500));

    expect(find.byType(CardFrontWidget), findsOneWidget);
    expect(find.byType(CardBackWidget), findsNothing);
  });
  });
}
