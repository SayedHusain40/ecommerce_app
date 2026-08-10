import 'package:hive_ce/hive.dart';

class HiveService {
  final Box<String> box;
  const HiveService(this.box);

  Future<void> saveItem({required String key, required String jsonValue}) => box.put(key, jsonValue);

  String? getItem({required String key}) => box.get(key);

  Map<String, String> getAll() => box.toMap().cast<String, String>();

  Future<void> removeItem({required String key}) => box.delete(key);

  bool containsKey({required String key}) => box.containsKey(key);
  
  Future<void> clear() => box.clear();
}