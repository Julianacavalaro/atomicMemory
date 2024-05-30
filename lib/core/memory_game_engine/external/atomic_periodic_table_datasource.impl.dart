import 'dart:io';
import 'dart:convert' as json_utility;

import '../constants/constants.dart';
import '../domain/model/atomic_periodic_table.model.dart';
import '../infrastructure/datasource/atomic_periodic_table_datasource.dart';

class AtomicElementSortDatasourceImpl extends AtomicPeriodicTableDatasource {
  final MemoryGameConstants constants;

  AtomicElementSortDatasourceImpl({required this.constants});

  @override
  Future<AtomicPeriodicTable> getElementSort() async {
    final jsonData = await File(constants.elementsFilePath).readAsString();
    final Map<String, dynamic> jsonMap = json_utility.jsonDecode(jsonData);
    return AtomicPeriodicTableImpl.fromJson(jsonMap);
  }
}
