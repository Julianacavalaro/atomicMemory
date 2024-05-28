import 'package:atomic_memory/core/memory_game_engine/domain/model/atomic_element.model.dart';
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
  const globalTestelementMg = AtomicElementImpl(
      name: "Magnésio", atomicNumber: "12", atomicMass: "24.305", symbol: "Mg");

  group('Teste ElementAtomImpl', () {
    test('Testando construtores', () {
      final elementBe = AtomicElementImpl.fromJson(jsonBe);

      expect(elementBe, isA<AtomicElement>());
      expect(elementBe, isA<AtomicElementImpl>());

      expect(globalTestelementMg, isA<AtomicElement>());
      expect(globalTestelementMg, isA<AtomicElementImpl>());
    });

    test('Testanto propriedades', () {
      final elementMg = AtomicElementImpl.fromJson(jsonMg);
      final emptyElement = AtomicElementImpl.fromJson({});

      expect(emptyElement.atomicMass.isEmpty, true);
      expect(emptyElement.atomicNumber.isEmpty, true);
      expect(emptyElement.name.isEmpty, true);
      expect(emptyElement.symbol.isEmpty, true);

      expect(elementMg.atomicMass.isNotEmpty, true);
      expect(elementMg.atomicMass == jsonMg[AtomicElement.atomicMassJsonKey],
          true);

      expect(elementMg.atomicNumber.isNotEmpty, true);
      expect(
          elementMg.atomicNumber == jsonMg[AtomicElement.atomicNumberJsonKey],
          true);

      expect(elementMg.name.isNotEmpty, true);
      expect(elementMg.name == jsonMg[AtomicElement.nameJsonKey], true);

      expect(elementMg.symbol.isNotEmpty, true);
      expect(elementMg.symbol == jsonMg[AtomicElement.symbolJsonKey], true);
    });

    test('Testanto operadores de comparação', () {
      final elementCa = AtomicElementImpl.fromJson(jsonCa);
      final elementMg = AtomicElementImpl.fromJson(jsonMg);

      expect(elementMg == globalTestelementMg, true);
      expect(elementMg.hashCode == globalTestelementMg.hashCode, true);
      expect(elementCa != elementMg, true);
    });
  });
}
