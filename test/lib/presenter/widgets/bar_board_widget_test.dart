import 'package:atomic_memory/feature/presenter/widgets/bar_board_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  group('Teste da classe BarBoardWidget', (){
    testWidgets('teste de widget', (WidgetTester tester)async{
      await tester.pumpWidget(const MaterialApp(home: BarBoardWidget()));

      expect(find.byType(Container), findsOneWidget);
      //se está exibindo o ícone do e clicável microscópio, o átomo.
      //verificar se está somando os valores (chumbados agora)
    
    });
  });
}