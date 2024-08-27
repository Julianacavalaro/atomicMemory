import 'package:atomic_memory/feature/domain/model/card_model.dart';
import 'package:atomic_memory/feature/presenter/widgets/card_game_widget.dart';
import 'package:flutter/material.dart';

class GamePage extends StatelessWidget {
  GamePage({super.key});

  final List<CardModel> cardList = [
    CardModelImpl(
        atomicMass: '12',
        atomicName: 'Lítio',
        atomicNumber: '55',
        atomicSymbol: 'Li'),
    CardModelImpl(
        atomicMass: '12',
        atomicName: 'Lítio',
        atomicNumber: '55',
        atomicSymbol: 'Li'),
    CardModelImpl(
        atomicMass: '44',
        atomicName: 'Potássio',
        atomicNumber: '55',
        atomicSymbol: 'K'),
    CardModelImpl(
        atomicMass: '44',
        atomicName: 'Potássio',
        atomicNumber: '55',
        atomicSymbol: 'K'),
    CardModelImpl(
        atomicMass: '88',
        atomicName: 'Urânio',
        atomicNumber: '123',
        atomicSymbol: 'U'),
    CardModelImpl(
        atomicMass: '88',
        atomicName: 'Urânio',
        atomicNumber: '123',
        atomicSymbol: 'U'),
    CardModelImpl(
        atomicMass: '44',
        atomicName: 'Ouro',
        atomicNumber: '33',
        atomicSymbol: 'Au'),
    CardModelImpl(
        atomicMass: '44',
        atomicName: 'Ouro',
        atomicNumber: '33',
        atomicSymbol: 'Au'),
    CardModelImpl(
        atomicMass: '77',
        atomicName: 'Platina',
        atomicNumber: '11',
        atomicSymbol: 'Pt'),
    CardModelImpl(
        atomicMass: '77',
        atomicName: 'Platina',
        atomicNumber: '11',
        atomicSymbol: 'Pt'),
    CardModelImpl(
        atomicMass: '99',
        atomicName: 'Titanio',
        atomicNumber: '155',
        atomicSymbol: 'Ti'),
    CardModelImpl(
        atomicMass: '99',
        atomicName: 'Titanio',
        atomicNumber: '155',
        atomicSymbol: 'Ti'),
  ]..shuffle();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 32, 153, 193),
              Color.fromARGB(245, 105, 188, 218),
            ],
          ),
        ),
        child: GridView.count(
          crossAxisCount: 3,
          childAspectRatio: 0.75,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.all(10.0),
          children: cardList
              .map((atomicElement) => CardGameWidget(
                    atomicElementModel: atomicElement,
                  ))
              .toList(),
        ),
      ),
    );
  }
}
