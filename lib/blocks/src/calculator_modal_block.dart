import 'package:flutter/material.dart';
import 'package:imc_calculator_db/styles/global_styles.dart';
import 'package:imc_calculator_db/components/_components.dart';

class CalculatorModalBlock extends StatefulWidget {
  const CalculatorModalBlock({
    super.key,
    required this.calculate,
  });

  final void Function({required double weight, required double height})
      calculate;

  @override
  State<CalculatorModalBlock> createState() => _CalculatorModalBlockState();
}

class _CalculatorModalBlockState extends State<CalculatorModalBlock> {
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();

  String? heightError;
  String? weightError;

  bool validationFields() {
    RegExp weightRegex = RegExp(r'^\d{1,3}(?:[.,]\d)?$', multiLine: false);
    RegExp heightRegex = RegExp(r'^\d(?:[.,]\d{2})?$', multiLine: false);

    if (!weightRegex.hasMatch(weightController.text)) {
      setState(() {
        weightError = 'Inválido';
      });
    }

    if (!heightRegex.hasMatch(heightController.text)) {
      setState(() {
        heightError = 'Inválido';
      });
    }

    return weightRegex.hasMatch(weightController.text) &&
        heightRegex.hasMatch(heightController.text);
  }

  void handleSubmit() {
    setState(() {
      weightError = null;
      heightError = null;
    });

    bool isValid = validationFields();

    if (isValid) {
      widget.calculate(
        weight: double.parse(weightController.text.replaceAll(',', '.')),
        height: double.parse(heightController.text.replaceAll(',', '.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            children: [
              Text(
                'Calculadora',
                textAlign: TextAlign.center,
                style: primaryTextStyle(
                  size: 35,
                  weight: FontWeight.bold,
                  color: primary,
                ),
              ),
              separator(height: 16),
              Row(
                children: [
                  Expanded(
                    child: TextInput(
                      label: 'Peso',
                      placeholder: 'Peso',
                      error: weightError,
                      keyType: TextInputType.number,
                      controller: weightController,
                      helperText: 'Ex.: 85.9',
                    ),
                  ),
                  separator(width: 8),
                  Expanded(
                    child: TextInput(
                      label: 'Altura',
                      placeholder: 'Altura',
                      error: heightError,
                      keyType: TextInputType.number,
                      controller: heightController,
                      helperText: 'Ex.: 1.69',
                    ),
                  ),
                ],
              ),
              separator(height: 15),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: TXTButton(
                  text: 'Calcular',
                  textSize: 20,
                  action: handleSubmit,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
