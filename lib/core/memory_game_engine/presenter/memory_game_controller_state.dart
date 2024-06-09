import '../domain/model/game/memory_game_item.model.dart';
import '../domain/model/game/memory_game_settings.model.dart';
import '../domain/model/game/memory_game_statistics.model.dart';

class MemoryGameControllerState {
  final MemoryGameSettings gameSettings;
  final MemoryGameStatistics statistics;

  List<MemoryGameItem> get gameElements => gameSettings.elements;
  MemoryGameStatus get gameStatus => gameSettings.gameStatus;

  const MemoryGameControllerState(
      {this.gameSettings = const MemoryGameSettingsImpl(),
      this.statistics = const MemoryGameStatisticsImpl()});

  factory MemoryGameControllerState.gameLoading() =>
      const MemoryGameControllerState(
          gameSettings:
              MemoryGameSettingsImpl(gameStatus: MemoryGameStatus.idle),
          statistics: MemoryGameStatisticsImpl());

  factory MemoryGameControllerState.gameReady({
    required List<MemoryGameItem> elements,
    required MemoryGameSize size,
  }) =>
      MemoryGameControllerState(
          gameSettings: MemoryGameSettingsImpl(
              elements: elements,
              gameSize: size,
              gameStatus: MemoryGameStatus.ready),
          statistics: const MemoryGameStatisticsImpl());

  factory MemoryGameControllerState.gameFailure() =>
      const MemoryGameControllerState(
          gameSettings:
              MemoryGameSettingsImpl(gameStatus: MemoryGameStatus.error),
          statistics: MemoryGameStatisticsImpl());

  MemoryGameControllerState copyWith({
    MemoryGameSettings? gameSettings,
    MemoryGameStatistics? statistics,
  }) =>
      MemoryGameControllerState(
          gameSettings: gameSettings ?? this.gameSettings,
          statistics: statistics ?? this.statistics);
}
