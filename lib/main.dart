import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:imc_calculator_db/app.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Directory dirPath = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(dirPath.path);

  runApp(const ImcCalculatorApp());
}
