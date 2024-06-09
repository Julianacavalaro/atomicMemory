import '../atomic_chemestry/atomic_element.model.dart';

abstract class MemoryGameItem<T> {
  final T itemData; //
  bool isFounded = false;

  MemoryGameItem({required this.itemData, this.isFounded = false});
  MemoryGameItem<T> copyWith({T? item, bool? isFounded});
}

class AtomicMemoryGameItem extends MemoryGameItem<AtomicElement> {
  AtomicMemoryGameItem({required super.itemData, super.isFounded = false});

  @override
  MemoryGameItem<AtomicElement> copyWith(
          {AtomicElement? item, bool? isFounded}) =>
      AtomicMemoryGameItem(
        itemData: item ?? itemData,
        isFounded: isFounded ?? this.isFounded,
      );
}
