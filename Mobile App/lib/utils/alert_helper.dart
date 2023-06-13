import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';

class AlertHelper {
  //----show alert method
  static Future<void> showAlert(
    BuildContext context,
    String title,
    String desc,
    DialogType type,
  ) async {
    AwesomeDialog(
      context: context,
      dialogType: type,
      animType: AnimType.scale,
      title: title,
      desc: desc,
      btnCancelOnPress: () {},
      btnOkOnPress: () {},
    ).show();
  }

//-----------show a snack bar
  static void showSnackBar(
      BuildContext context, String message, AnimatedSnackBarType type) {
    AnimatedSnackBar.material(message,
            type: type, duration: const Duration(milliseconds: 50))
        .show(context);
  }
}
