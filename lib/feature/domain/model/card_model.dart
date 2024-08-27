abstract class CardModel {
  final String atomicSymbol;
  final String atomicName;
  final String atomicMass;
  final String atomicNumber;

  CardModel(
      {required this.atomicSymbol,
      required this.atomicName,
      required this.atomicMass,
      required this.atomicNumber});
}

class CardModelImpl extends CardModel {
  CardModelImpl(
      {required super.atomicSymbol,
      required super.atomicName,
      required super.atomicMass,
      required super.atomicNumber});
}
