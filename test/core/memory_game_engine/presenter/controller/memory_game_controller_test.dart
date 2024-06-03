import 'package:atomic_memory/core/memory_game_engine/domain/model/atomic_chemestry/atomic_periodic_table.model.dart';
import 'package:atomic_memory/core/memory_game_engine/domain/model/game/memory_game_item.model.dart';
import 'package:atomic_memory/core/memory_game_engine/domain/model/game/memory_game_settings.model.dart';
import 'package:atomic_memory/core/memory_game_engine/domain/usecase/generate_randomic_memoy_game_items_usecase.dart';
import 'package:atomic_memory/core/memory_game_engine/presenter/memory_game_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mock/json_data.dart';

class GenerateRandomicMemoyGameItemsUsecaseMock extends Mock
    implements GenerateRandomicMemoyGameItemsUsecase {}

void main() {
  final usecaseMock = GenerateRandomicMemoyGameItemsUsecaseMock();

  final periodicTableElements =
      AtomicPeriodicTableImpl.fromJson(elementGroupsJson);

  final elementsFromFamily1A = periodicTableElements.groups[0].elements;

  List<AtomicMemoryGameItem> memoryGameItensMock() => [
        AtomicMemoryGameItem(
            itemData: elementsFromFamily1A[0], isFounded: false),
        AtomicMemoryGameItem(
            itemData: elementsFromFamily1A[3], isFounded: false),
        AtomicMemoryGameItem(
            itemData: elementsFromFamily1A[0], isFounded: false),
        AtomicMemoryGameItem(
            itemData: elementsFromFamily1A[3], isFounded: false),
      ];

  const defaultGameSize = MemoryGameSize.size_4x4;

  group('Teste AtomicMemoryGameControllerImp', () {
    final engine = AtomicMemoryGameControllerImp(
        generateRandomicMemoryGameItemsUsecase: usecaseMock);

    test('Verificando estado inicial', () {
      expect(engine.value.gameStatus == MemoryGameStatus.idle, true);
      expect(engine.value.gameSettings.elements.isEmpty, true);
      expect(
          engine.value.gameSettings.gameSize == MemoryGameSize.size_4x4, true);
    });

    test('Verificando criação de novo jogo', () async {
      when(() => usecaseMock.generateGameItems(size: defaultGameSize))
          .thenAnswer((_) async => memoryGameItensMock());

      final gameCreated = await engine.newGame(size: defaultGameSize);
      expect(gameCreated.gameSize == defaultGameSize, true);
      expect(gameCreated.elements.length == 4, true);
      expect(gameCreated.gameStatus == MemoryGameStatus.ready, true);
      expect(engine.value.statistics.numberOfFailure == 0, true);
      expect(engine.value.statistics.numberOfSuccess == 0, true);
    });

    test('Verificando inicialização de novo jogo', () async {
      when(() => usecaseMock.generateGameItems(size: defaultGameSize))
          .thenAnswer((_) async => memoryGameItensMock());

      await engine.newGame(size: defaultGameSize);
      engine.startGame();
      expect(engine.value.gameStatus == MemoryGameStatus.running, true);
    });

    test('Verificando sucesso em match e estatisticas do jogo', () async {
      when(() => usecaseMock.generateGameItems(size: defaultGameSize))
          .thenAnswer((_) async => memoryGameItensMock());

      await engine.newGame(size: defaultGameSize);
      engine.startGame();
      final lithium01 = engine.value.gameElements[0];
      final lithium02 = engine.value.gameElements[2];

      expect(!lithium01.isFounded, true);
      expect(!lithium02.isFounded, true);

      var matchResults = engine.hasMatch(item1: lithium01, item2: lithium02);
      expect(matchResults, true);
      expect(engine.value.statistics.numberOfSuccess == 1, true);
      expect(engine.value.statistics.numberOfFailure == 0, true);
      expect(engine.value.gameStatus == MemoryGameStatus.running, true);

      expect(lithium01.isFounded, true);
      expect(lithium02.isFounded, true);
    });

    test('Verificando erro em match e estatisticas do jogo', () async {
      when(() => usecaseMock.generateGameItems(size: defaultGameSize))
          .thenAnswer((_) async => memoryGameItensMock());

      await engine.newGame(size: defaultGameSize);
      engine.startGame();
      final lithium01 = engine.value.gameElements[0];
      final rubidio = engine.value.gameElements[1];

      expect(!lithium01.isFounded, true);
      expect(!rubidio.isFounded, true);

      var matchResults = engine.hasMatch(item1: lithium01, item2: rubidio);
      expect(matchResults, false);
      expect(engine.value.statistics.numberOfSuccess == 0, true);
      expect(engine.value.statistics.numberOfFailure == 1, true);
      expect(engine.value.gameStatus == MemoryGameStatus.running, true);

      expect(!lithium01.isFounded, true);
      expect(!rubidio.isFounded, true);
    });
  });
}
