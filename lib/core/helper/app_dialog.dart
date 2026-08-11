import 'package:bookia/core/helper/extension.dart';
import 'package:flutter/material.dart';

class AppDialog {
  static Future<dynamic> loadingDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (dialogContext) => Dialog(
        backgroundColor: Colors.transparent,
        child: const Center(child: CircularProgressIndicator()),
      ),
    );
  }

  static Future<dynamic> errorDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text("Error"),
        content: const Text("Error Please enter correct data"),
        actions: [
          TextButton(onPressed: () => context.pop(), child: const Text("OK")),
        ],
      ),
    );
  }
}
