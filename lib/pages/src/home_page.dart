import 'package:flutter/material.dart';
import 'package:imc_calculator_db/components/_components.dart';
import 'package:imc_calculator_db/styles/global_styles.dart';
import 'package:imc_calculator_db/utils/_utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void handleNext() {
    String? name = Profile.getString('name');

    if (name == null) {
      navigator(
        context: context,
        path: "/profile",
        remove: true,
      );
    } else {
      navigator(
        context: context,
        path: "/dashboard",
        remove: true,
      );
    }
  }

  @override
  void initState() {
    Profile.getPreferences();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Bem-vindo(a) ao",
                    style: primaryTextStyle(
                      size: 20,
                      weight: FontWeight.bold,
                      color: primary,
                    ),
                  ),
                  const Logo(),
                  Text(
                    "Sua calculadora de IMC",
                    style: primaryTextStyle(
                      size: 20,
                      weight: FontWeight.bold,
                      color: primary,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: Row(
          children: [
            separator(width: 32),
            Expanded(
              child: SizedBox(
                height: 48,
                child: TXTButton(
                  text: "Começar",
                  textSize: 18,
                  action: () => handleNext(),
                ),
              ),
            ),
          ],
        ));
  }
}
