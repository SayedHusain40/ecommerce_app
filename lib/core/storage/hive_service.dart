import 'package:hive_ce/hive.dart';

class HiveService {
  final Map<String, Box<String>> _boxes = {};

  // Opens a box if not already open, does nothing if already opened
  Future<void> openBox(String boxName) async {
    if (_boxes.containsKey(boxName)) return;
    _boxes[boxName] = await Hive.openBox<String>(boxName);
  }

  // Closes the box and removes it from the open boxes map
  Future<void> closeBox(String boxName) async {
    await _boxes[boxName]?.close();
    _boxes.remove(boxName);
  }

  // Returns the opened box, throws if it wasn't opened first
  Box<String> _box(String boxName) {
    final box = _boxes[boxName];
    if (box == null) throw Exception('Box "$boxName" not opened yet');
    return box;
  }

  // Saves/updates a value under the given key
  Future<void> saveItem({
    required String boxName,
    required dynamic key,
    required String jsonValue,
  }) => _box(boxName).put(key, jsonValue);

  // Returns null if not exist
  String? getItem({required String boxName, required dynamic key}) =>
      _box(boxName).get(key);

  // Adds a value with an auto-generated int key, returns that key
  Future<int> addItem({required String boxName, required String jsonValue}) =>
      _box(boxName).add(jsonValue);

  // Returns all key-value pairs in the box as a Map
  Map<K, String> getAll<K>(String boxName) =>
      _box(boxName).toMap().cast<K, String>();

  // Removes the value with the given key, does nothing if key doesn't exist
  Future<void> removeItem({required String boxName, required dynamic key}) =>
      _box(boxName).delete(key);

  // Removes only the given keys, leaving the rest of the box intact
  Future<void> deleteAll({
    required String boxName,
    required Iterable<dynamic> keys,
  }) => _box(boxName).deleteAll(keys);

  // Returns true if the key exists in the box
  bool containsKey({required String boxName, required dynamic key}) =>
      _box(boxName).containsKey(key);

  // Removes all key-value pairs from the box
  Future<void> clear(String boxName) => _box(boxName).clear();
}
