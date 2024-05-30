import 'package:atomic_memory/core/memory_game_engine/domain/model/atomic_element_sort.model.dart';
import '../../domain/repository/atomic_elements_sort_repository.dart';
import '../datasource/atomic_element_sort_datasource.dart';

class AtomicElementsSortRepositoryImpl extends AtomicElementsSortRepository {
  final AtomicElementSortDatasource elementSortDatasource;

  AtomicElementsSortRepositoryImpl({required this.elementSortDatasource});

  @override
  Future<AtomicElementSort> getAtomicElements() =>
      elementSortDatasource.getElementSort();
}
