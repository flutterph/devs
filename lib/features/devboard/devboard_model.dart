import 'package:devs/core/models/dev.dart';
import 'package:devs/core/repositories/devs_repository.dart';
import 'package:flutter/material.dart';

class DevBoardModel extends ChangeNotifier {
  DevBoardModel(this.devsRepository);

  final IDevsRepository devsRepository;
  final List<Dev> _cacheDevs = [];

  Future<List<Dev>> getDevs() async {
    if (_cacheDevs.isEmpty) {
      _cacheDevs.addAll(
        await devsRepository.getDevs(),
      );
    }

    return _cacheDevs;
  }
}
