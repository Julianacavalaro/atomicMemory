import 'package:atomic_memory/core/memory_game_engine/domain/model/atomic_element_sort.model.dart';
import 'package:atomic_memory/core/memory_game_engine/infrastructure/datasource/element_sort_datasource.dart';
import 'package:atomic_memory/core/memory_game_engine/infrastructure/repository/atomic_elements_sort_repository.impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mock/json_data.dart';

class ElementSortDatasourceMock extends Mock implements ElementSortDatasource {}

void main() {
  final datasourceMock = ElementSortDatasourceMock();
  final periodicTableMock = AtomicElementSortImpl.fromJson(elementGroupsJson);
  final repository =
      AtomicElementsSortRepositoryImpl(elementSortDatasource: datasourceMock);

  group('Teste AtomicElementsSortRepositoryImpl', () {
    test('Verificando obter tabela periódica', () async {
      when(() => datasourceMock.getElementSort())
          .thenAnswer((_) async => periodicTableMock);

      final results = await repository.getAtomicElements();
      expect(results, isA<AtomicElementSort>());
      expect(results.groups.isNotEmpty, true);
    });
  });
}
