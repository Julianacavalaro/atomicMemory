import 'package:atomic_memory/feature/presenter/pages/game_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'game_page_finders.dart';

void main() {
  GamePageFinders finders = GamePageFinders();
  group('Teste da classe GamePage', () {
    testWidgets('teste de widget', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: GamePage()));

      expect(find.byType(Center), findsOne);

      expect(finders.backgroundColor , findsOne);

      //teste de quantas cartas estão disponíveis na tela
    });
  });
}
