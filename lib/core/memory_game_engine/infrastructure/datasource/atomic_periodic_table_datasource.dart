import 'package:atomic_memory/core/memory_game_engine/domain/model/atomic_chemestry/atomic_periodic_table.model.dart';

abstract class AtomicPeriodicTableDatasource {
  Future<AtomicPeriodicTable> getElementSort();
}
