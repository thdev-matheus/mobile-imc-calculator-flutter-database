import 'package:flutter/material.dart';
import 'package:imc_calculator_db/repositories/_repositories.dart';
import 'package:imc_calculator_db/styles/global_styles.dart';
import 'package:imc_calculator_db/components/_components.dart';
import 'package:imc_calculator_db/models/_models.dart';
import 'package:imc_calculator_db/blocks/_blocks.dart';
import 'package:imc_calculator_db/utils/_utils.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  late ImcRepository imcRepository;
  Person person = Person(name: '');

  void deleteImc({required String id}) {
    showDialog(
      context: context,
      builder: (BuildContext bc) {
        return RemoveImcModal(
          actionRemove: () async {
            person.removeImc(id: id);
            await imcRepository.saveData(person.data['results']);
            setState(() {});
          },
        );
      },
    );
  }

  Future<void> calculate({
    required double weight,
    required double height,
  }) async {
    Imc newImc = Imc(weight: weight, height: height);
    person.addImc(imc: newImc);
    await imcRepository.saveData(person.data['results']);
    setState(() {});
  }

  Future<void> getData() async {
    imcRepository = await ImcRepository.loadRepository();

    var results = imcRepository.loadData();

    for (var item in results) {
      Imc imc = Imc(
        weight: item['weight'],
        height: item['height'],
        dayDB: item['day'],
        hourDB: item['hour'],
      );

      person.addImc(imc: imc);
    }

    String? name = Profile.getString('name');

    if (name != null) {
      setState(() {
        person.setName(name);
      });
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void initState() {
    // TODO: implement initState
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 32),
          children: [
            Text(
              'Resultados para: ${person.data['name']}',
              textAlign: TextAlign.center,
              style: primaryTextStyle(
                size: 30,
                weight: FontWeight.bold,
              ),
            ),
            separator(height: 16),
            ...cardListBlock(
              person: person,
              deleteImc: deleteImc,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext bc) => Dialog(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: CalculatorModalBlock(
                calculate: calculate,
              ),
            ),
          );
        },
        backgroundColor: primary,
        child: const Icon(
          Icons.calculate,
        ),
      ),
    );
  }
}
