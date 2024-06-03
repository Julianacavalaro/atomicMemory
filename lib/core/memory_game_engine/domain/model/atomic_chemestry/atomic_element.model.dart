abstract class AtomicElement {
  final String name;
  final String symbol;
  final String atomicNumber;
  final String atomicMass;

  static String get nameJsonKey => 'name';
  static String get symbolJsonKey => 'symbol';
  static String get atomicNumberJsonKey => 'atomicNumber';
  static String get atomicMassJsonKey => 'atomicMass';

  const AtomicElement(
      {required this.name,
      required this.symbol,
      required this.atomicNumber,
      required this.atomicMass});
}

class AtomicElementImpl extends AtomicElement {
  const AtomicElementImpl(
      {required super.name,
      required super.symbol,
      required super.atomicNumber,
      required super.atomicMass});

  factory AtomicElementImpl.fromJson(Map<String, dynamic> json) =>
      AtomicElementImpl(
        name: json[AtomicElement.nameJsonKey] ?? '',
        atomicNumber: json[AtomicElement.atomicNumberJsonKey] ?? '',
        atomicMass: json[AtomicElement.atomicMassJsonKey] ?? '',
        symbol: json[AtomicElement.symbolJsonKey] ?? '',
      );

  // Map<String, dynamic> toJson() => {
  //       AtomicElement.nameJsonKey: name,
  //       AtomicElement.atomicNumberJsonKey: atomicNumber,
  //       AtomicElement.atomicMassJsonKey: atomicMass,
  //       AtomicElement.symbolJsonKey: symbol,
  //     };

  @override
  bool operator ==(Object other) {
    return other is AtomicElementImpl &&
        other.atomicNumber == atomicNumber &&
        other.atomicMass == atomicMass &&
        other.name == name &&
        other.symbol == symbol;
  }

  @override
  int get hashCode =>
      (name.length + symbol.length + atomicNumber.length) * 0x0A;
}
