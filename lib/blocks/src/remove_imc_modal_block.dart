import 'package:flutter/material.dart';
import 'package:imc_calculator_db/styles/global_styles.dart';
import 'package:imc_calculator_db/components/_components.dart';

class RemoveImcModal extends StatefulWidget {
  const RemoveImcModal({
    super.key,
    required this.actionRemove,
  });

  final void Function() actionRemove;

  @override
  State<RemoveImcModal> createState() => _RemoveImcModalState();
}

class _RemoveImcModalState extends State<RemoveImcModal> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsPadding: const EdgeInsets.only(bottom: 16, right: 32),
      title: Center(
        child: Text(
          'Apagar Resultado',
          style: primaryTextStyle(
            color: primary,
            size: 25,
            weight: FontWeight.bold,
          ),
        ),
      ),
      content: Text(
        'Você está prestes a apagar este resultado. Deseja continuar?',
        style: primaryTextStyle(
          size: 18,
        ),
      ),
      actions: [
        InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Text(
            'não',
            style: primaryTextStyle(
              color: primary,
              size: 20,
              weight: FontWeight.bold,
            ),
          ),
        ),
        separator(width: 8),
        InkWell(
          onTap: widget.actionRemove,
          child: Text(
            'sim',
            style: primaryTextStyle(
              color: Colors.red,
              size: 20,
              weight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
