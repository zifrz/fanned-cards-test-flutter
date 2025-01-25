import 'dart:math';
import 'package:flutter/material.dart';
import 'colored_card.dart';

class FannedCards extends StatefulWidget {
  final int numCards;
  const FannedCards({Key? key, required this.numCards}) : super(key: key);

  @override
  State<FannedCards> createState() => _FannedCardsState();
}

class _FannedCardsState extends State<FannedCards> {
  late List<CardData> cardDataList;
  int? activeCardIndex;

  @override
  void initState() {
    super.initState();
    _initializeCards(widget.numCards);
  }

  @override
  void didUpdateWidget(covariant FannedCards oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.numCards != widget.numCards) {
      _adjustCards(oldWidget.numCards);
    }
  }

  void _initializeCards(int numCards) {
    cardDataList = List.generate(
      numCards,
      (index) => CardData(
        key: UniqueKey(),
        color: Color.fromARGB(
          255,
          Random().nextInt(256),
          Random().nextInt(256),
          Random().nextInt(256),
        ),
      ),
    );
  }

  void _adjustCards(int oldNumCards) {
    if (widget.numCards > oldNumCards) {
      // Add new cards
      cardDataList.addAll(
        List.generate(
          widget.numCards - oldNumCards,
          (_) => CardData(
            key: UniqueKey(),
            color: Color.fromARGB(
              255,
              Random().nextInt(256),
              Random().nextInt(256),
              Random().nextInt(256),
            ),
          ),
        ),
      );
    } else if (widget.numCards < oldNumCards) {
      // Remove cards from the end
      cardDataList.removeRange(widget.numCards, oldNumCards);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.numCards <= 0) {
      print('SizedBox ${widget.numCards}');
      return SizedBox(
        width: 100, // Match card width
        height: 150, // Match card height
      );
    }

    if (widget.numCards == 1) {
      print('SizedBox ${widget.numCards}');
      return SizedBox(
        width: 100, // Match card width
        height: 150, // Match card height
        child: GestureDetector(
          key: cardDataList[0].key,
          onTap: () {
            setState(() {
              activeCardIndex = activeCardIndex == 0 ? null : 0;
            });
          },
          child: ColoredCard(
            key: cardDataList[0].key,
            isActive: activeCardIndex == 0,
            color: cardDataList[0].color,
          ),
        ),
      );
    }

    return Stack(
      alignment: Alignment.center,
      children: List.generate(widget.numCards, (index) {
        double alignmentValue = -1.0 + (index / (widget.numCards - 1)) * 2.0;
        return GestureDetector(
          key: cardDataList[index].key,
          onTap: () {
            setState(() {
              activeCardIndex = activeCardIndex == index ? null : index;
            });
          },
          child: Align(
            alignment: Alignment(alignmentValue, 0),
            child: ColoredCard(
              key: cardDataList[index].key,
              isActive: activeCardIndex == index,
              color: cardDataList[index].color,
            ),
          ),
        );
      }),
    );
  }
}

class CardData {
  final Key key;
  final Color color;

  CardData({required this.key, required this.color});
}
