import 'dart:convert';
import 'package:devs/core/models/dev.dart';
import 'package:flutter/services.dart';

abstract class IDevsLocalDataSource {
  Future<List<Dev>> getDevs();
}

class DevsLocalDataSource implements IDevsLocalDataSource {
  @override
  Future<List<Dev>> getDevs() async {
    try {
      String data = await rootBundle.loadString('assets/data/devs.json');
      final result = json.decode(data);
      return List<Dev>.from(
        result.map(
          (i) => Dev.fromJson(i),
        ),
      );
    } catch (e) {
      return [];
    }
  }
}
