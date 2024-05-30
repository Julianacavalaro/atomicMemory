import 'package:atomic_memory/core/memory_game_engine/domain/model/atomic_element_sort.model.dart';

abstract class ElementSortDatasource {
  Future<AtomicElementSort> getElementSort();
}
