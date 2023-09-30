import 'package:flutter/material.dart';

void navigator({
  required BuildContext context,
  required String path,
  bool remove = false,
  Map args = const {},
}) {
  remove
      ? Navigator.of(context)
          .pushNamedAndRemoveUntil(path, (route) => false, arguments: args)
      : Navigator.of(context).pushNamed(path, arguments: args);
}
