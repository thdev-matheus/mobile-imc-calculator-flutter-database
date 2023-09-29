import 'package:flutter/material.dart';
import 'package:imc_calculator_db/models/_models.dart';
import 'package:imc_calculator_db/styles/global_styles.dart';

class ImcCard extends StatelessWidget {
  const ImcCard({super.key, required this.imc, required this.deleteImc});

  final Imc imc;
  final void Function({required String id}) deleteImc;

  Color getColor(Map<String, dynamic> imcData) {
    double imcValue = imcData['imc'];

    if (imcValue < 16) {
      return Colors.red;
    } else if (imcValue < 17) {
      return Colors.orange;
    } else if (imcValue < 18.5) {
      return Colors.yellow;
    } else if (imcValue < 25) {
      return Colors.green;
    } else if (imcValue < 30) {
      return Colors.yellow;
    } else if (imcValue < 35) {
      return Colors.orange;
    } else if (imcValue < 40) {
      return Colors.red;
    } else {
      return Colors.purple;
    }
  }

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> imcData = imc.getData();

    return InkWell(
      onLongPress: () => deleteImc(id: imcData['id']),
      child: Card(
        clipBehavior: Clip.hardEdge,
        elevation: 5,
        child: SizedBox(
          height: 100,
          child: Row(
            children: [
              Container(
                width: 10,
                color: getColor(imcData),
              ),
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Peso: ',
                                style: primaryTextStyle(
                                  size: 18,
                                  weight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                '${imcData['weight']}Kg',
                                style: primaryTextStyle(
                                  size: 18,
                                  weight: FontWeight.bold,
                                  color: primary,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                'Altura: ',
                                style: primaryTextStyle(
                                  size: 18,
                                  weight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                '${imcData['height']}m',
                                style: primaryTextStyle(
                                  size: 18,
                                  weight: FontWeight.bold,
                                  color: primary,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "IMC",
                            style: primaryTextStyle(
                              size: 18,
                              weight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            imcData['imc'].toString(),
                            style: primaryTextStyle(
                              size: 40,
                              weight: FontWeight.bold,
                              color: secondary,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            imcData['day'].toString(),
                            style: primaryTextStyle(
                              size: 14,
                              weight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            imcData['hour'].toString(),
                            style: primaryTextStyle(
                              size: 16,
                              weight: FontWeight.bold,
                              color: secondary,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
