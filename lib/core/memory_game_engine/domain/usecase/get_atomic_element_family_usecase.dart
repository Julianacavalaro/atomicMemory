import '../model/atomic_chemestry/atomic_element_family.model.dart';
import '../model/atomic_chemestry/atomic_periodic_table.model.dart';

abstract class GetAtomicElementFamilyUsecase {
  AtomicElementFamily getAtomicElementFamilyFromIndex(
      {required AtomicPeriodicTable periodicTable, required int index});
}

class GetAtomicElementFamilyUsecaseImpl extends GetAtomicElementFamilyUsecase {
  @override
  AtomicElementFamily getAtomicElementFamilyFromIndex(
      {required AtomicPeriodicTable periodicTable, required int index}) {
    try {
      if (index >= 0 && index < periodicTable.groups.length) {
        return periodicTable.groups[index];
      }
    } catch (_) {}

    return AtomicElementFamilyImpl.empty();
  }
}
