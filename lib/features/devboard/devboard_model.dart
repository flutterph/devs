import 'package:devs/core/models/dev.dart';
import 'package:devs/core/repositories/devs_repository.dart';
import 'package:flutter/material.dart';

class DevBoardModel extends ChangeNotifier {
  final IDevsRepository devsRepository;

  DevBoardModel(this.devsRepository);

  Future<List<Dev>> getDevs() async {
    return devsRepository.getDevs();
  }
}