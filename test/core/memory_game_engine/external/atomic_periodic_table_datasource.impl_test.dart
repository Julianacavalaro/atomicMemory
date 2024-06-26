import 'package:atomic_memory/core/memory_game_engine/constants/constants.dart';
import 'package:atomic_memory/core/memory_game_engine/external/atomic_periodic_table_datasource.impl.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final constants = MemoryGameConstants();
  final dataSource = AtomicElementSortDatasourceImpl(constants: constants);

  group('Teste ElementSortDatasourceImpl', () {
    test('Verificando dados de ${constants.elementsFilePath}', () async {
      final data = await dataSource.getElementSort();
      expect(data.groups.isNotEmpty, true);
    });
  });
}
