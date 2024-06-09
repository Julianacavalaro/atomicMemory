import 'package:atomic_memory/core/memory_game_engine/domain/model/atomic_chemestry/atomic_periodic_table.model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../mock/json_data.dart';

void main() {
  group('Teste AtomicElementSortImpl', () {
    test('Verificando construtor', () {
      final elementSort = AtomicPeriodicTableImpl.fromJson(elementGroupsJson);
      expect(elementSort.groups.isNotEmpty, true);
      expect(elementSort.groups.first.familyId == "1A", true);
      expect(elementSort.groups.first.elements.first.symbol == "Li", true);
    });
  });
}
