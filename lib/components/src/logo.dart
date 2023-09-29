import 'package:flutter/material.dart';
import "package:google_fonts/google_fonts.dart";
import 'package:imc_calculator_db/styles/global_styles.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "I",
              style: GoogleFonts.patuaOne(
                fontSize: 120,
                color: primary,
              ),
            ),
            Text(
              "M",
              style: GoogleFonts.patuaOne(
                fontSize: 150,
                color: secondary,
              ),
            ),
            Text(
              "C",
              style: GoogleFonts.patuaOne(
                fontSize: 120,
                color: tertiary,
              ),
            ),
          ],
        ),
        Container(
          width: 270,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: const Color.fromARGB(201, 255, 174, 174),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "calculator",
                style: GoogleFonts.titilliumWeb(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: black,
                  letterSpacing: 8,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
