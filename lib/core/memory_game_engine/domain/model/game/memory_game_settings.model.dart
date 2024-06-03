import 'memory_game_item.model.dart';

enum MemoryGameStatus {
  idle, // não existe partida criada
  ready, // partida criada e pronta para ser inicializada
  running, // partida estar em andamento
  finished, // partida terminou parada!
  error, // não foi possível criar a partida erro.
}

enum MemoryGameSize {
  size_4x4,
  size_6x6,
}

abstract class MemoryGameSettings {
  final MemoryGameSize gameSize;
  final List<MemoryGameItem> elements;
  final MemoryGameStatus gameStatus;

  const MemoryGameSettings({
    required this.gameStatus,
    required this.gameSize,
    required this.elements,
  });

  MemoryGameSettings copyWith({
    MemoryGameSize? gameSize,
    List<MemoryGameItem>? elements,
    MemoryGameStatus? gameStatus,
  });
}

class MemoryGameSettingsImpl extends MemoryGameSettings {
  const MemoryGameSettingsImpl({
    super.gameStatus = MemoryGameStatus.idle,
    super.gameSize = MemoryGameSize.size_4x4,
    super.elements = const [],
  });

  @override
  MemoryGameSettings copyWith({
    MemoryGameSize? gameSize,
    List<MemoryGameItem>? elements,
    MemoryGameStatus? gameStatus,
  }) =>
      MemoryGameSettingsImpl(
          gameSize: gameSize ?? this.gameSize,
          elements: elements ?? this.elements,
          gameStatus: gameStatus ?? this.gameStatus);
}
