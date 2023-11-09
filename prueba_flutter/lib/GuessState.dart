
import 'package:flutter/material.dart';

class GuessState extends ChangeNotifier {
  String _message = "";
  int _vidas = 3;

  int get vidas=>_vidas;
  set vidas(int vidas) {
    _vidas = vidas;
    notifyListeners();
  }
  String get message => _message;
  set message(String message) {
    _message = message;
    notifyListeners();
  }
}