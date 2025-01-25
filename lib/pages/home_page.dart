import 'package:flutter/material.dart';
import 'package:fannedcardstestflutter/components/fanned_cards.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _numCards = 11;

  void _addCard() {
    setState(() {
      _numCards++;
      print("Number of Cards: $_numCards");
    });
  }

  void _removeCard() {
    setState(() {
      if (_numCards > 0) _numCards--;
      print("Number of Cards: $_numCards");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FannedCards(numCards: _numCards),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: _addCard, child: const Text('Add')),
              const SizedBox(width: 20),
              ElevatedButton(
                onPressed: _removeCard,
                child: const Text('Remove'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
