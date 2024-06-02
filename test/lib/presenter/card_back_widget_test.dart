import 'package:atomic_memory/presenter/widgets/card_back_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets(
    'Verifica o layout do card_back',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        const CardBackWidget(),
      );
      final imageAtom = find.byType(SvgPicture);
      expect(imageAtom, findsOneWidget);

      final clipRRect = find.byType(ClipRRect);
      expect(clipRRect, findsOneWidget);

      final container = find.byType(Container);
      expect(container, findsOneWidget);

      final containerDecoration = tester
          .widget<Container>(find.byType(Container))
          .decoration as BoxDecoration;
      expect(containerDecoration.borderRadius, BorderRadius.circular(8));
    },
  );
}
