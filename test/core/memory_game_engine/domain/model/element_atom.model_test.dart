import 'package:atomic_memory/core/memory_game_engine/domain/model/element_atom.model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final jsonBe = {
    "name": "Berílio",
    "symbol": "Be",
    "atomicNumber": "4",
    "atomicMass": "9.012"
  };
  final jsonMg = {
    "name": "Magnésio",
    "symbol": "Mg",
    "atomicNumber": "12",
    "atomicMass": "24.305"
  };
  final jsonCa = {
    "name": "Cálcio",
    "symbol": "Ca",
    "atomicNumber": "20",
    "atomicMass": "40.078"
  };
  const globalTestelementMg = ElementAtomImpl(
      name: "Magnésio", atomicNumber: "12", atomicMass: "24.305", symbol: "Mg");

  group('Teste ElementAtomImpl', () {
    test('Testando construtores', () {
      final elementBe = ElementAtomImpl.fromJson(jsonBe);

      expect(elementBe, isA<ElementAtom>());
      expect(elementBe, isA<ElementAtomImpl>());

      expect(globalTestelementMg, isA<ElementAtom>());
      expect(globalTestelementMg, isA<ElementAtomImpl>());
    });

    test('Testanto propriedades', () {
      final elementMg = ElementAtomImpl.fromJson(jsonMg);
      final emptyElement = ElementAtomImpl.fromJson({});

      expect(emptyElement.atomicMass.isEmpty, true);
      expect(emptyElement.atomicNumber.isEmpty, true);
      expect(emptyElement.name.isEmpty, true);
      expect(emptyElement.symbol.isEmpty, true);

      expect(elementMg.atomicMass.isNotEmpty, true);
      expect(
          elementMg.atomicMass == jsonMg[ElementAtom.atomicMassJsonKey], true);

      expect(elementMg.atomicNumber.isNotEmpty, true);
      expect(elementMg.atomicNumber == jsonMg[ElementAtom.atomicNumberJsonKey],
          true);

      expect(elementMg.name.isNotEmpty, true);
      expect(elementMg.name == jsonMg[ElementAtom.nameJsonKey], true);

      expect(elementMg.symbol.isNotEmpty, true);
      expect(elementMg.symbol == jsonMg[ElementAtom.symbolJsonKey], true);
    });

    test('Testanto operadores de comparação', () {
      final elementCa = ElementAtomImpl.fromJson(jsonCa);
      final elementMg = ElementAtomImpl.fromJson(jsonMg);

      expect(elementMg == globalTestelementMg, true);
      expect(elementMg.hashCode == globalTestelementMg.hashCode, true);
      expect(elementCa != elementMg, true);
    });
  });
}
