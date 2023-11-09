import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prueba_flutter/GuessState.dart';
import 'package:provider/provider.dart';

class Pantalla2 extends StatefulWidget {
  const Pantalla2({Key? key});

  @override
  State<Pantalla2> createState() => _Mypantalla2State();
}

class _Mypantalla2State extends State<Pantalla2> {
  int _counter = 0;
  TextEditingController _textFieldController = TextEditingController();


  void _restart() {

    GuessState guessState = Provider.of<GuessState>(context, listen: false);
    guessState.vidas = 3;
  }

  void adivinar() {
    if (_textFieldController.text.isEmpty) {
      _showErrorMessage("Enter a number");
    } else {
      int guessedNumber = int.tryParse(_textFieldController.text) ?? -1;

      if (guessedNumber >= 0 && guessedNumber <= 100) {
        int randomNumber = _generateRandomNumber();
        _compareNumbers(guessedNumber, randomNumber);
      } else {
        _showErrorMessage("Enter a number between 0 and 100");
      }
    }
  }

  int _generateRandomNumber() {
    return Random().nextInt(101);
  }

  void _compareNumbers(int guessedNumber, int randomNumber) {
    // Your logic to compare numbers and update GuessState goes here
    GuessState guessState = Provider.of<GuessState>(context, listen: false);
    // Example:
    if (guessedNumber == randomNumber) {
      // Guessed correctly
      guessState.message = "Congratulations! You guessed correctly.";
    } else {
      // Incorrect guess, decrease lives
      guessState.vidas --;
      guessState.message = "Sorry, try again.";
      //guessState.decreaseLives();
    }
  }

  void _showErrorMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    String message = context.watch<GuessState>().message;
    int vidas = context.watch<GuessState>().vidas;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Pantalla 1"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Hello ${message}",
              style: const TextStyle(
                fontSize: 30,
                color: Colors.deepOrange,
              ),
            ),
            SizedBox(
              width: 150,
              height: 150,
              child: Image.asset("assets/picture.png"),
            ),
            const Text(
              "Guess a number",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                color: Colors.deepOrange,
                fontStyle: FontStyle.italic,
                letterSpacing: 4,
                wordSpacing: 15,
                shadows: [
                  Shadow(
                    color: Colors.blueAccent,
                    offset: Offset(2, 1),
                    blurRadius: 10,
                  )
                ],
              ),
            ),
            TextField(
              controller: _textFieldController,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter> [
                FilteringTextInputFormatter.digitsOnly
              ],
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "numero",
              ),
            ),
            ElevatedButton(
              onPressed: adivinar,
              child: const Text("Adivina"),
            ),
            Text("Tus vidas $vidas"),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _restart,
        tooltip: 'restart',
        child: const Icon(Icons.restart_alt),
      ),
    );
  }
}
