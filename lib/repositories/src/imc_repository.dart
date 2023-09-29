import 'package:hive/hive.dart';
import 'package:imc_calculator_db/models/_models.dart';

class ImcRepository {
  static late Box _box;

  ImcRepository._create();

  Future<ImcRepository> loadRepository() async {
    if (Hive.isBoxOpen('calculators')) {
      _box = Hive.box('calculators');
    } else {
      _box = await Hive.openBox('calculators');
    }

    return ImcRepository._create();
  }

  List<Imc> loadData() {
    List<Imc> response = [];

    var results = _box.get('results');

    if (results == null) {
      return [];
    } else {
      results.map((item) {
        Imc imc = Imc(
          weight: item['weight'],
          height: item['height'],
          dayDB: item['day'],
          hourDB: item['hour'],
        );
        response.add(imc);
      });

      return response;
    }
  }

  Future<void> saveData(List<Imc> results) async {
    List<Map<String, dynamic>> resultsMap = [];

    results.map((imc) {
      resultsMap.add(imc.data);
    });

    await _box.put('results', resultsMap);
  }
}
