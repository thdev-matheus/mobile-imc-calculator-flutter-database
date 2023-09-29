import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:math' as math;

class Imc {
  final String _id = UniqueKey().toString();
  String _day = 'dd/mm/aa';
  String _hour = 'hh:mm';

  late double _weight;
  late double _height;
  late double _imc;

  void setWeight({required double weight}) => _weight = weight;

  void setHeight({required double height}) => _height = height;

  Future<void> setDayHour() async {
    DateTime now = DateTime.now().subtract(const Duration(hours: 3));

    DateFormat formatterDay = DateFormat('dd/MM/yy', 'pt_BR');
    DateFormat formatterHour = DateFormat('HH', 'pt_BR');
    DateFormat formatterMinute = DateFormat('mm', 'pt_BR');

    String hour = '${formatterHour.format(now)}h${formatterMinute.format(now)}';

    _day = formatterDay.format(now);
    _hour = hour;
  }

  void setImc() {
    double imc = _weight / (math.pow(_height, 2));
    String fixedImc = imc.toStringAsFixed(1);
    _imc = double.parse(fixedImc);
  }

  Map<String, dynamic> getData() => {
        "id": _id,
        "day": _day,
        "hour": _hour,
        "weight": _weight,
        "height": _height,
        "imc": _imc,
      };

  Imc({required double weight, required double height}) {
    _weight = weight;
    _height = height;
    setImc();
    setDayHour();
  }
}
