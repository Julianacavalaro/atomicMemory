import 'package:atomic_memory/core/memory_game_engine/domain/model/element_family.model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final family1AJson = {
    "name": "alcalinos",
    "elements": [
      {
        "name": "Lítio",
        "symbol": "Li",
        "atomicNumber": "3",
        "atomicMass": "6.9410"
      },
      {
        "name": "Sódio",
        "symbol": "Na",
        "atomicNumber": "11",
        "atomicMass": "22.990"
      },
      {
        "name": "Potássio",
        "symbol": "K",
        "atomicNumber": "19",
        "atomicMass": "39.098"
      },
      {
        "name": "Rubídio",
        "symbol": "Rb",
        "atomicNumber": "37",
        "atomicMass": "85.468"
      },
      {
        "name": "Césio",
        "symbol": "Cs",
        "atomicNumber": "55",
        "atomicMass": "132.91"
      },
      {
        "name": "Frâncio",
        "symbol": "Cs",
        "atomicNumber": "87",
        "atomicMass": "223"
      }
    ]
  };

  group('Testes ElementFamilyImpl', () {
    test('Verificando construtores', () {
      final family1A = ElementFamilyImpl.fromJson(family1AJson);
      final emptyFamily = ElementFamilyImpl.fromJson({});
      const unknowFamily = ElementFamilyImpl(name: 'unknow', elements: []);

      expect(family1A, isA<ElementFamilyImpl>());
      expect(family1A, isA<ElementFamily>());

      expect(emptyFamily, isA<ElementFamilyImpl>());
      expect(emptyFamily, isA<ElementFamily>());

      expect(unknowFamily, isA<ElementFamilyImpl>());
      expect(unknowFamily, isA<ElementFamily>());
    });

    test('Verificando propriedades', () {
      final family1A = ElementFamilyImpl.fromJson(family1AJson);
      final emptyFamily = ElementFamilyImpl.fromJson({});
      const unknowFamily = ElementFamilyImpl(name: 'unknow', elements: []);

      expect(family1A.name.isNotEmpty, true);
      expect(unknowFamily.name == 'unknow', true);
      expect(emptyFamily.name.isEmpty, true);

      expect(family1A.elements.isNotEmpty, true);
      expect(family1A.elements.length == 6, true);
      expect(unknowFamily.elements.isEmpty, true);
      expect(emptyFamily.elements.isEmpty, true);

      final lastElement1A = family1A.elements.last;
      expect(lastElement1A.symbol == "Cs", true);
    });
  });
}
