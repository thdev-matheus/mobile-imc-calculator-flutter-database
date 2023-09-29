import 'package:flutter/material.dart';
import 'package:imc_calculator_db/blocks/_blocks.dart';
import 'package:imc_calculator_db/components/_components.dart';
import 'package:imc_calculator_db/styles/global_styles.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
          children: [
            separator(height: 32),
            const Logo(),
            separator(height: 32),
            Center(
              child: Column(
                children: [
                  Text(
                    "Perfil",
                    style: primaryTextStyle(
                        size: 36, weight: FontWeight.bold, color: primary),
                  ),
                  Text(
                    "Para começarmos, digite o seu nome:",
                    style: primaryTextStyle(
                        size: 16, weight: FontWeight.bold, color: primary),
                  )
                ],
              ),
            ),
            separator(height: 24),
            const FormProfile()
          ],
        ),
      ),
    );
  }
}
