import '../model/atomic_element_sort.model.dart';

abstract class AtomicElementsSortRepository {
  Future<AtomicElementSort> getAtomicElements();
}
