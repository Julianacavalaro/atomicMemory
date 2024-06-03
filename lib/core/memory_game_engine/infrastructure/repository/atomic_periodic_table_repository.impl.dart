import 'package:atomic_memory/core/memory_game_engine/domain/model/atomic_chemestry/atomic_periodic_table.model.dart';
import '../../domain/repository/atomic_periodic_table_repository.dart';
import '../datasource/atomic_periodic_table_datasource.dart';

class AtomicPeriodicTableRepositoryImpl extends AtomicPeriodicTableRepository {
  final AtomicPeriodicTableDatasource elementSortDatasource;

  AtomicPeriodicTableRepositoryImpl({required this.elementSortDatasource});

  @override
  Future<AtomicPeriodicTable> getAtomicElements() =>
      elementSortDatasource.getElementSort();
}
