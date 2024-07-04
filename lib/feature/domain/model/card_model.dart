abstract class CardModel {
  String atomicSymbol;
  String atomicName;

  String atomicMass;

  String atomicNumber;

  CardModel(
      {required this.atomicSymbol,
      required this.atomicName,
      required this.atomicMass,
      required this.atomicNumber});

}
class CardModelImpl implements CardModel{
  @override
  late String atomicMass;

  @override
  late String atomicName;

  @override
  late String atomicNumber;

  @override
  late String atomicSymbol;
  
}
