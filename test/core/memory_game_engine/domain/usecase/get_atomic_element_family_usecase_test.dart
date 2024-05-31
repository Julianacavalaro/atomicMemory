import 'package:atomic_memory/core/memory_game_engine/domain/model/atomic_periodic_table.model.dart';
import 'package:atomic_memory/core/memory_game_engine/domain/usecase/get_atomic_element_family_usecase.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../mock/json_data.dart';

void main() {
  final GetAtomicElementFamilyUsecase usecase =
      GetAtomicElementFamilyUsecaseImpl();

  final periodicTable = AtomicPeriodicTableImpl.fromJson(elementGroupsJson);

  group('Teste GetAtomicElementFamilyUsecase ', () {
    test('Verificando obter família da tabela periódica', () {
      final family1A = usecase.getAtomicElementFamilyFromIndex(
          periodicTable: periodicTable, index: 0);

      expect(family1A.familyId == '1A', true);
      expect(family1A.elements.isNotEmpty, true);
    });

    test('Verificando obter família da tabela periódica com indice inválido',
        () {
      final family1A = usecase.getAtomicElementFamilyFromIndex(
          periodicTable: periodicTable, index: -1);
      expect(family1A.elements.isEmpty, true);
    });
  });
}
