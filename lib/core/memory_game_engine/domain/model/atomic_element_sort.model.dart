import 'element_family.model.dart';

abstract class AtomicElementSort {
  final List<ElementFamily> groups;
  static String get groupsJsonKey => "groups";
  const AtomicElementSort({required this.groups});
}

class AtomicElementSortImpl extends AtomicElementSort {
  AtomicElementSortImpl({required super.groups});

  factory AtomicElementSortImpl.fromJson(Map<String, dynamic> json) =>
      AtomicElementSortImpl(
          groups: json[AtomicElementSort.groupsJsonKey] == null
              ? []
              : (json[AtomicElementSort.groupsJsonKey] as List)
                  .map((elementFamily) =>
                      ElementFamilyImpl.fromJson(elementFamily))
                  .toList());
}
