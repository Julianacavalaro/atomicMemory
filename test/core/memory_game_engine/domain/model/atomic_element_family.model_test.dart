import 'package:atomic_memory/core/memory_game_engine/domain/model/atomic_chemestry/atomic_element_family.model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final family1AJson = {
    "id": "1A",
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
      final family1A = AtomicElementFamilyImpl.fromJson(family1AJson);
      final emptyFamily = AtomicElementFamilyImpl.fromJson({});
      const unknowFamily =
          AtomicElementFamilyImpl(name: 'unknow', elements: [], familyId: '2A');

      expect(family1A, isA<AtomicElementFamilyImpl>());
      expect(family1A, isA<AtomicElementFamily>());

      expect(emptyFamily, isA<AtomicElementFamilyImpl>());
      expect(emptyFamily, isA<AtomicElementFamily>());

      expect(unknowFamily, isA<AtomicElementFamilyImpl>());
      expect(unknowFamily, isA<AtomicElementFamily>());
    });

    test('Verificando propriedades', () {
      final family1A = AtomicElementFamilyImpl.fromJson(family1AJson);
      final emptyFamily = AtomicElementFamilyImpl.fromJson({});
      const unknowFamily =
          AtomicElementFamilyImpl(name: 'unknow', elements: [], familyId: '2A');

      expect(family1A.name.isNotEmpty, true);
      expect(unknowFamily.name == 'unknow', true);
      expect(emptyFamily.name.isEmpty, true);

      expect(family1A.elements.isNotEmpty, true);
      expect(family1A.elements.length == 6, true);
      expect(unknowFamily.elements.isEmpty, true);
      expect(emptyFamily.elements.isEmpty, true);
      expect(family1A.familyId == "1A", true);

      final lastElement1A = family1A.elements.last;
      expect(lastElement1A.symbol == "Cs", true);
    });

    test('Verificando operadores', () {
      final family1A = AtomicElementFamilyImpl.fromJson(family1AJson);
      final familyCopy1A = AtomicElementFamilyImpl.fromJson(family1AJson);
      final emptyFamily = AtomicElementFamilyImpl.fromJson({});
      const unknowFamily =
          AtomicElementFamilyImpl(name: '', elements: [], familyId: '');

      expect(family1A == familyCopy1A, true);
      expect(family1A.hashCode == familyCopy1A.hashCode, true);
      expect(emptyFamily == unknowFamily, true);
      expect(emptyFamily.hashCode == unknowFamily.hashCode, true);
      expect(family1A != emptyFamily, true);
    });
  });
}
