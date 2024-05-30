import 'package:atomic_memory/core/memory_game_engine/constants/constants.dart';
import 'package:atomic_memory/core/memory_game_engine/external/element_sort_datasource.impl.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final constants = MemoryGameConstants();
  final dataSource = ElementSortDatasourceImpl(constants: constants);

  group('Teste ElementSortDatasourceImpl', () {
    test('Verificando dados de ${constants.elementsFilePath}', () async {
      final data = await dataSource.getElementSort();
      expect(data.groups.isNotEmpty, true);
    });
  });
}
