import 'dart:io';
import 'dart:convert' as json_utility;

import '../constants/constants.dart';
import '../domain/model/atomic_element_sort.model.dart';
import '../infrastructure/datasource/element_sort_datasource.dart';

class ElementSortDatasourceImpl extends ElementSortDatasource {
  final MemoryGameConstants constants;

  ElementSortDatasourceImpl({required this.constants});

  @override
  Future<AtomicElementSort> getElementSort() async {
    final jsonData = await File(constants.elementsFilePath).readAsString();
    final Map<String, dynamic> jsonMap = json_utility.jsonDecode(jsonData);
    return AtomicElementSortImpl.fromJson(jsonMap);
  }
}
