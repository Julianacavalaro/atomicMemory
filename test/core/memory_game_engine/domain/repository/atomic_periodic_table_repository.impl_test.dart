import 'package:atomic_memory/core/memory_game_engine/domain/model/atomic_chemestry/atomic_periodic_table.model.dart';
import 'package:atomic_memory/core/memory_game_engine/infrastructure/datasource/atomic_periodic_table_datasource.dart';
import 'package:atomic_memory/core/memory_game_engine/infrastructure/repository/atomic_periodic_table_repository.impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mock/json_data.dart';

class ElementSortDatasourceMock extends Mock
    implements AtomicPeriodicTableDatasource {}

void main() {
  final datasourceMock = ElementSortDatasourceMock();
  final periodicTableMock = AtomicPeriodicTableImpl.fromJson(elementGroupsJson);
  final repository =
      AtomicPeriodicTableRepositoryImpl(elementSortDatasource: datasourceMock);

  group('Teste AtomicElementsSortRepositoryImpl', () {
    test('Verificando obter tabela periódica', () async {
      when(() => datasourceMock.getElementSort())
          .thenAnswer((_) async => periodicTableMock);

      final results = await repository.getAtomicElements();
      expect(results, isA<AtomicPeriodicTable>());
      expect(results.groups.isNotEmpty, true);
    });
  });
}
