import 'atomic_element_family.model.dart';

abstract class AtomicPeriodicTable {
  final List<AtomicElementFamily> groups;
  static String get groupsJsonKey => "groups";
  const AtomicPeriodicTable({required this.groups});
}

class AtomicPeriodicTableImpl extends AtomicPeriodicTable {
  AtomicPeriodicTableImpl({required super.groups});

  factory AtomicPeriodicTableImpl.fromJson(Map<String, dynamic> json) =>
      AtomicPeriodicTableImpl(
          groups: json[AtomicPeriodicTable.groupsJsonKey] == null
              ? []
              : (json[AtomicPeriodicTable.groupsJsonKey] as List)
                  .map((elementFamily) =>
                      AtomicElementFamilyImpl.fromJson(elementFamily))
                  .toList());
}
