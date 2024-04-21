import 'package:flutter/material.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  List<String> _directions = ['forward', 'backward', 'left', 'right', 'stop'];
  List<String> get directions => _directions;
  set directions(List<String> value) {
    _directions = value;
  }

  void addToDirections(String value) {
    _directions.add(value);
  }

  void removeFromDirections(String value) {
    _directions.remove(value);
  }

  void removeAtIndexFromDirections(int index) {
    _directions.removeAt(index);
  }

  void updateDirectionsAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _directions[index] = updateFn(_directions[index]);
  }

  void insertAtIndexInDirections(int index, String value) {
    _directions.insert(index, value);
  }
}
