import 'package:flutter/foundation.dart';
import '../domain/model/game/memory_game_item.model.dart';
import '../domain/model/game/memory_game_settings.model.dart';
import '../domain/model/game/memory_game_statistics.model.dart';
import '../domain/usecase/generate_randomic_memoy_game_items_usecase.dart';
import 'memory_game_controller_state.dart';

abstract class MemoryGameController
    extends ValueNotifier<MemoryGameControllerState> {
  MemoryGameController(super.value);

  Future<MemoryGameSettings> newGame(
      {MemoryGameSize size = MemoryGameSize.size_4x4});
  Future<MemoryGameSettings> restartGame();
  MemoryGameSettings startGame();
  MemoryGameSettings finishGame();
  bool hasMatch({required MemoryGameItem item1, required MemoryGameItem item2});
  void updateGameStatistics({required MemoryGameStatistics statistics});
}

class AtomicMemoryGameControllerImp extends MemoryGameController {
  final GenerateRandomicMemoyGameItemsUsecase
      generateRandomicMemoryGameItemsUsecase;

  AtomicMemoryGameControllerImp(
      {required this.generateRandomicMemoryGameItemsUsecase})
      : super(const MemoryGameControllerState());

  @override
  bool hasMatch(
      {required MemoryGameItem item1, required MemoryGameItem item2}) {
    late MemoryGameStatistics updatedStatistics;
    late bool hasMatch;

    if (item1.itemData == item2.itemData) {
      item2.isFounded = item1.isFounded = true;

      updatedStatistics = value.statistics
          .copyWith(numberOfSuccess: value.statistics.numberOfSuccess + 1);
      hasMatch = true;
    } else {
      updatedStatistics = value.statistics
          .copyWith(numberOfFailure: value.statistics.numberOfFailure + 1);

      hasMatch = false;
    }

    updateGameStatistics(statistics: updatedStatistics);

    if (_shouldFinishGame(updatedStatistics)) {
      finishGame();
    }
    return hasMatch;
  }

  @override
  Future<MemoryGameSettings> newGame(
      {MemoryGameSize size = MemoryGameSize.size_4x4}) async {
    value = MemoryGameControllerState.gameLoading();

    final memoryGameItems = await generateRandomicMemoryGameItemsUsecase
        .generateGameItems(size: size);

    if (memoryGameItems.isNotEmpty) {
      value = MemoryGameControllerState.gameReady(
          elements: memoryGameItems, size: size);
    } else {
      value = MemoryGameControllerState.gameFailure();
    }
    return value.gameSettings;
  }

  @override
  Future<MemoryGameSettings> restartGame() async {
    final currentSize = value.gameSettings.gameSize;
    finishGame();
    final newMemoryGame = await newGame(size: currentSize);
    startGame();
    return newMemoryGame;
  }

  @override
  MemoryGameSettings startGame() {
    if (value.gameStatus == MemoryGameStatus.ready) {
      final newGameSettings =
          value.gameSettings.copyWith(gameStatus: MemoryGameStatus.running);
      value = value.copyWith(gameSettings: newGameSettings);
    }
    return value.gameSettings;
  }

  @override
  MemoryGameSettings finishGame() {
    if (value.gameStatus == MemoryGameStatus.running) {
      final newGameSettings =
          value.gameSettings.copyWith(gameStatus: MemoryGameStatus.finished);
      value = value.copyWith(gameSettings: newGameSettings);
    }
    return value.gameSettings;
  }

  @override
  void updateGameStatistics({required MemoryGameStatistics statistics}) =>
      value = value.copyWith(statistics: statistics);

  bool _shouldFinishGame(MemoryGameStatistics statistics) =>
      (statistics.numberOfSuccess * 2) == value.gameElements.length;
}
