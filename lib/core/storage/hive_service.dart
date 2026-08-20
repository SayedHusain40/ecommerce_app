import 'package:hive_ce/hive.dart';

class HiveService {
  final Map<String, Box<String>> _boxes = {};

  Future<void> openBox(String boxName) async {
    if (_boxes.containsKey(boxName)) return;
    _boxes[boxName] = await Hive.openBox<String>(boxName);
  }

  Future<void> closeBox(String boxName) async {
    await _boxes[boxName]?.close();
    _boxes.remove(boxName);
  }

  Box<String> _box(String boxName) {
    final box = _boxes[boxName];
    if (box == null) throw Exception('Box "$boxName" not opened yet');
    return box;
  }

  Future<void> saveItem({
    required String boxName,
    required String key,
    required String jsonValue,
  }) => _box(boxName).put(key, jsonValue);

  // Returns nul of not exit
  String? getItem({required String boxName, required String key}) =>
      _box(boxName).get(key);

  Map<String, String> getAll(String boxName) =>
      _box(boxName).toMap().cast<String, String>();

  Future<void> removeItem({required String boxName, required String key}) =>
      _box(boxName).delete(key);

  // Removes only the given keys, leaving the rest of the box intact
  Future<void> deleteAll({
    required String boxName,
    required Iterable<String> keys,
  }) => _box(boxName).deleteAll(keys);

  bool containsKey({required String boxName, required String key}) =>
      _box(boxName).containsKey(key);

  Future<void> clear(String boxName) => _box(boxName).clear();
}
