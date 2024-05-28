import 'package:atomic_memory/core/memory_game_engine/domain/model/atomic_element.model.dart';

abstract class ElementFamily {
  final String familyId;
  final String name;
  final List<AtomicElement> elements;

  static String get nameJsonKey => "name";
  static String get elementsJsonKey => "elements";
  static String get familyIdJsonKey => "id";

  const ElementFamily(
      {required this.name, required this.elements, required this.familyId});
}

class ElementFamilyImpl extends ElementFamily {
  const ElementFamilyImpl({
    required super.name,
    required super.elements,
    required super.familyId,
  });

  factory ElementFamilyImpl.fromJson(Map<String, dynamic> json) =>
      ElementFamilyImpl(
          familyId: json[ElementFamily.familyIdJsonKey] ?? '',
          name: json[ElementFamily.nameJsonKey] ?? '',
          elements: json[ElementFamily.elementsJsonKey] == null
              ? []
              : (json[ElementFamily.elementsJsonKey] as List)
                  .map((element) => AtomicElementImpl.fromJson(element))
                  .toList());

  @override
  bool operator ==(Object other) {
    return other is ElementFamilyImpl &&
        name == other.name &&
        familyId == other.familyId &&
        elements.length == other.elements.length;
  }

  @override
  int get hashCode => (name.length + elements.length + familyId.length) * 0x1A;
}
