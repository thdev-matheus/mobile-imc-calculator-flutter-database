import 'package:imc_calculator_db/models/_models.dart';

class Person {
  late String _name;
  final List<Imc> _results = [];

  Map<String, dynamic> getData() => {"name": _name, "results": _results};

  void setName(String name) => _name = name;

  void addImc({required Imc imc}) => _results.insert(0, imc);

  void removeImc({required String id}) {
    _results.removeWhere((imc) => imc.getData()["id"] == id);
  }

  Person({required String name}) {
    _name = name;
  }
}
