import 'package:flutter/material.dart';
import 'package:imc_calculator_db/pages/_pages.dart';

Map<String, Widget Function(BuildContext)> routes = {
  "/": (context) => const HomePage(),
  "/profile": (context) => const ProfilePage(),
  "/dashboard": (context) => const DashboardPage()
};
