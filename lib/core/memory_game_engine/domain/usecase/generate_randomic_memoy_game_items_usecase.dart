import 'dart:math';

import '../model/game/memory_game_item.model.dart';
import '../model/game/memory_game_settings.model.dart';
import 'get_periodic_table_usecase.dart';

abstract class GenerateRandomicMemoyGameItemsUsecase {
  Future<List<MemoryGameItem>> generateGameItems(
      {required MemoryGameSize size});
}

class GenerateRandomicMemoryGameAtomicItemsUsecaseImpl
    extends GenerateRandomicMemoyGameItemsUsecase {
  final Random random;
  final GetAtomicPeriodicTableUsecase periodicTableUsecase;

  GenerateRandomicMemoryGameAtomicItemsUsecaseImpl(
      {required this.random, required this.periodicTableUsecase});

  @override
  Future<List<MemoryGameItem>> generateGameItems(
      {required MemoryGameSize size}) async {
    try {
      final itensNumberToCreate = _getNumberOfItens(size);
      final periodicTable = await periodicTableUsecase.periodicTable;
      final List<AtomicMemoryGameItem> memoryGameItemList = [];

      for (var elementCounter = 0;
          elementCounter < itensNumberToCreate;
          elementCounter++) {
        final familyChoiceIndex = random.nextInt(periodicTable.groups.length);
        final currentFamily = periodicTable.groups[familyChoiceIndex];

        final elementChoiceIndex =
            random.nextInt(currentFamily.elements.length);

        final currentElement =
            currentFamily.elements.removeAt(elementChoiceIndex);

        final item =
            AtomicMemoryGameItem(isFounded: false, itemData: currentElement);
        memoryGameItemList.addAll([item, item]);
      }

      memoryGameItemList.shuffle(random);
      return memoryGameItemList;
    } catch (_) {}

    return [];
  }

  int _getNumberOfItens(MemoryGameSize size) {
    switch (size) {
      case MemoryGameSize.size_4x4:
        return 8;
      case MemoryGameSize.size_6x6:
        return 18;
    }
  }
}
