import 'package:atomic_memory/core/memory_game_engine/domain/model/atomic_element.model.dart';

abstract class ElementFamily {
  final String name;
  final List<AtomicElement> elements;

  static String get nameJsonKey => "name";
  static String get elementsJsonKey => "elements";

  const ElementFamily({required this.name, required this.elements});
}

class ElementFamilyImpl extends ElementFamily {
  const ElementFamilyImpl({required super.name, required super.elements});

  factory ElementFamilyImpl.fromJson(Map<String, dynamic> json) =>
      ElementFamilyImpl(
          name: json[ElementFamily.nameJsonKey] ?? '',
          elements: json[ElementFamily.elementsJsonKey] == null
              ? []
              : (json[ElementFamily.elementsJsonKey] as List)
                  .map((element) => AtomicElementImpl.fromJson(element))
                  .toList());

  @override
  bool operator ==(Object other) {
    return other is ElementFamilyImpl && name == other.name;
  }

  @override
  int get hashCode => (name.length + elements.length) * 0x1A;
}
