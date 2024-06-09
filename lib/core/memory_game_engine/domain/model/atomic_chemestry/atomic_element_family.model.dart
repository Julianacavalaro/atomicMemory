import 'package:atomic_memory/core/memory_game_engine/domain/model/atomic_chemestry/atomic_element.model.dart';

abstract class AtomicElementFamily {
  final String familyId;
  final String name;
  final List<AtomicElement> elements;

  static String get nameJsonKey => "name";
  static String get elementsJsonKey => "elements";
  static String get familyIdJsonKey => "id";

  const AtomicElementFamily(
      {required this.name, required this.elements, required this.familyId});
}

class AtomicElementFamilyImpl extends AtomicElementFamily {
  const AtomicElementFamilyImpl({
    required super.name,
    required super.elements,
    required super.familyId,
  });

  factory AtomicElementFamilyImpl.empty() =>
      AtomicElementFamilyImpl.fromJson({});

  factory AtomicElementFamilyImpl.fromJson(Map<String, dynamic> json) =>
      AtomicElementFamilyImpl(
          familyId: json[AtomicElementFamily.familyIdJsonKey] ?? '',
          name: json[AtomicElementFamily.nameJsonKey] ?? '',
          elements: json[AtomicElementFamily.elementsJsonKey] == null
              ? []
              : (json[AtomicElementFamily.elementsJsonKey] as List)
                  .map((element) => AtomicElementImpl.fromJson(element))
                  .toList());

  @override
  bool operator ==(Object other) {
    return other is AtomicElementFamilyImpl &&
        name == other.name &&
        familyId == other.familyId &&
        elements.length == other.elements.length;
  }

  @override
  int get hashCode => (name.length + elements.length + familyId.length) * 0x1A;
}
