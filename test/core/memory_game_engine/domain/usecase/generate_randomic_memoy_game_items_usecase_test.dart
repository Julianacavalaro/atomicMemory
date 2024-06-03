import 'dart:math';

import 'package:atomic_memory/core/memory_game_engine/domain/model/atomic_chemestry/atomic_periodic_table.model.dart';
import 'package:atomic_memory/core/memory_game_engine/domain/model/game/memory_game_item.model.dart';
import 'package:atomic_memory/core/memory_game_engine/domain/model/game/memory_game_settings.model.dart';
import 'package:atomic_memory/core/memory_game_engine/domain/usecase/generate_randomic_memoy_game_items_usecase.dart';
import 'package:atomic_memory/core/memory_game_engine/domain/usecase/get_periodic_table_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../../../../mock/json_data.dart';

class GetAtomicPeriodicTableUsecaseMock extends Mock
    implements GetAtomicPeriodicTableUsecase {}

void main() {
  final random = Random();
  final periodicTable = AtomicPeriodicTableImpl.fromJson(elementGroupsJson);
  final periodicTableUsecase = GetAtomicPeriodicTableUsecaseMock();

  final usecase = GenerateRandomicMemoryGameAtomicItemsUsecaseImpl(
      random: random, periodicTableUsecase: periodicTableUsecase);

  group('Teste GenerateRandomicMemoryGameAtomicItemsUsecaseImpl', () {
    test('Verificando cenário gerar itens com sucesso', () async {
      when(() => periodicTableUsecase.periodicTable)
          .thenAnswer((_) async => periodicTable);

      final results =
          await usecase.generateGameItems(size: MemoryGameSize.size_4x4);

      expect(results.isNotEmpty, true);
      expect(results, isA<List<AtomicMemoryGameItem>>());
      expect(results.length == 16, true);
    });

    test('Verificando cenário exception ao gerar itens', () async {
      when(() => periodicTableUsecase.periodicTable).thenThrow(Exception());
      final results =
          await usecase.generateGameItems(size: MemoryGameSize.size_4x4);

      expect(results.isEmpty, true);
    });
  });
}
