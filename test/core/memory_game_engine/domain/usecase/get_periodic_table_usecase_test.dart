import 'package:atomic_memory/core/memory_game_engine/domain/model/atomic_periodic_table.model.dart';
import 'package:atomic_memory/core/memory_game_engine/domain/repository/atomic_periodic_table_repository.dart';
import 'package:atomic_memory/core/memory_game_engine/domain/usecase/get_periodic_table_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../../../../mock/json_data.dart';

class AtomicPeriodicTableRepositoryMock extends Mock
    implements AtomicPeriodicTableRepository {}

void main() {
  final repository = AtomicPeriodicTableRepositoryMock();

  final GetAtomicPeriodicTableUsecaseImpl usecase =
      GetAtomicPeriodicTableUsecaseImpl(repository: repository);

  final periodicTableModel =
      AtomicPeriodicTableImpl.fromJson(elementGroupsJson);

  group('Teste GetAtomicPeriodicTableUsecaseImpl', () {
    test('Verificando obter tabela periódica', () async {
      when(() => repository.getAtomicElements())
          .thenAnswer((_) async => periodicTableModel);

      final data = await usecase.periodicTable;
      expect(data.groups.isNotEmpty, true);
    });
  });
}
