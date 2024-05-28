abstract class ElementAtom {
  final String name;
  final String symbol;
  final String atomicNumber;
  final String atomicMass;

  static String get nameJsonKey => 'name';
  static String get symbolJsonKey => 'symbol';
  static String get atomicNumberJsonKey => 'atomicNumber';
  static String get atomicMassJsonKey => 'atomicMass';

  const ElementAtom(
      {required this.name,
      required this.symbol,
      required this.atomicNumber,
      required this.atomicMass});
}

class ElementAtomImpl extends ElementAtom {
  const ElementAtomImpl(
      {required super.name,
      required super.symbol,
      required super.atomicNumber,
      required super.atomicMass});

  factory ElementAtomImpl.fromJson(Map<String, dynamic> json) =>
      ElementAtomImpl(
        name: json[ElementAtom.nameJsonKey] ?? '',
        atomicNumber: json[ElementAtom.atomicNumberJsonKey] ?? '',
        atomicMass: json[ElementAtom.atomicMassJsonKey] ?? '',
        symbol: json[ElementAtom.symbolJsonKey] ?? '',
      );

  Map<String, dynamic> toJson() => {
        ElementAtom.nameJsonKey: name,
        ElementAtom.atomicNumberJsonKey: atomicNumber,
        ElementAtom.atomicMassJsonKey: atomicMass,
        ElementAtom.symbolJsonKey: symbol,
      };

  @override
  bool operator ==(Object other) {
    return other is ElementAtomImpl &&
        other.atomicNumber == atomicNumber &&
        other.atomicMass == atomicMass &&
        other.name == name &&
        other.symbol == symbol;
  }

  @override
  int get hashCode =>
      (name.length + symbol.length + atomicNumber.length) * 0x0A;
}
