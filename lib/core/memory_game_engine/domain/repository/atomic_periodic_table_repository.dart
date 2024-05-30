import '../model/atomic_periodic_table.model.dart';

abstract class AtomicPeriodicTableRepository {
  Future<AtomicPeriodicTable> getAtomicElements();
}
