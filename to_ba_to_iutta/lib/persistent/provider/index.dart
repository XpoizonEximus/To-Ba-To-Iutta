import 'package:async/async.dart';
import 'package:to_ba_to_iutta/bytes.dart';
import 'package:to_ba_to_iutta/persistent/settings.dart';
import 'package:to_ba_to_iutta/service/algorithm/index.dart';
import 'package:to_ba_to_iutta/service/algorithm/packager/index.dart';

class AlgorithmProvider<T extends Algorithm> {
  final SettingsProvider _settings;
  final Pacakger<T> _packager;

  AlgorithmProvider(this._settings, this._packager);

  Future<T> get algorithm async =>
      _packager.load(StreamQueue(Stream.fromIterable(await _settings.get)));

  Future setAlgorithm(T value) async => await _settings
      .set(Bytes.fromList(await _packager.serialize(value).toList()));
}
