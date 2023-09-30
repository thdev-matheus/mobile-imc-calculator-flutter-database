import 'package:hive/hive.dart';
import 'package:imc_calculator_db/models/_models.dart';

class ImcRepository {
  static late Box _box;

  ImcRepository._create();

  static Future<ImcRepository> loadRepository() async {
    if (Hive.isBoxOpen('calculators')) {
      _box = Hive.box('calculators');
    } else {
      _box = await Hive.openBox('calculators');
    }

    return ImcRepository._create();
  }

  List<dynamic> loadData() {
    var results = _box.get('results');

    return results;
  }

  Future<void> saveData(List<Imc> results) async {
    List<Map<String, dynamic>> resultsMap = [];

    for (var imc in results) {
      resultsMap.add(imc.data);
    }

    await _box.put('results', resultsMap);
  }
}
