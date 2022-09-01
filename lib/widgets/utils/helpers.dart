// ignore_for_file: non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

mixin Helpers {
  void ShowSnakBar(BuildContext context,
      {required String messageerroe, bool error = false}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(messageerroe),
        backgroundColor: error ? Colors.red.shade700 : Colors.blue.shade300,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 3),
        // padding: EdgeInsets.all(20),
        elevation: 10,
        // dismissDirection: DismissDirection.vertical,
        dismissDirection: DismissDirection.horizontal,
        action: SnackBarAction(
          label: AppLocalizations.of(context)!.delete,
          onPressed: () {},
          textColor: Colors.white,
        ),

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
