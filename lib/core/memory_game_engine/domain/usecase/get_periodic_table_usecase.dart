import 'package:atomic_memory/core/memory_game_engine/domain/repository/atomic_periodic_table_repository.dart';
import '../model/atomic_periodic_table.model.dart';

abstract class GetAtomicPeriodicTableUsecase {
  Future<AtomicPeriodicTable> get periodicTable;
}

class GetAtomicPeriodicTableUsecaseImpl extends GetAtomicPeriodicTableUsecase {
  final AtomicPeriodicTableRepository repository;

  GetAtomicPeriodicTableUsecaseImpl({required this.repository});

  @override
  Future<AtomicPeriodicTable> get periodicTable =>
      repository.getAtomicElements();
}
