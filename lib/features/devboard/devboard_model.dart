import 'package:devs/core/models/dev.dart';
import 'package:flutter/material.dart';

class DevBoardModel extends ChangeNotifier {
  DevBoardModel(this._devsStream);

  final Stream<List<Dev>> _devsStream;

  Stream<List<Dev>> get devsStream => _devsStream;
}
