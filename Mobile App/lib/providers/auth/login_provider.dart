import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:soil_app/controllers/auth_controller.dart';
import 'package:soil_app/utils/alert_helper.dart';

class LoginProvider extends ChangeNotifier {
  //---email controler
  final _email = TextEditingController();

  //--- get email controller
  TextEditingController get emailController => _email;

//----password controller
  final _password = TextEditingController();

  //--- get password controller
  TextEditingController get passwordController => _password;

  //----loading state
  bool _isLoading = false;

  //get loader state
  bool get isLoading => _isLoading;

  //-----set loading state
  set setLoader(bool val) {
    _isLoading = val;
    notifyListeners();
  }

  //----------login fuction
  Future<void> startSignin(BuildContext context) async {
    try {
      if (_email.text.isNotEmpty && _password.text.isNotEmpty) {
        //---start the loader
        setLoader = true;

        //----start creating the user account
        await AuthController.loginUser(_email.text, _password.text, context);

        //----stop the loader
        setLoader = false;
      } else {
        //-----shows a error dialog
        AlertHelper.showAlert(context, "Validation error",
            "Fill all the fields", DialogType.error);
      }
    } catch (e) {
      Logger().e(e);
      //----stop the loader
      setLoader = false;
    }
  }

  //----------forgot password fuction

//---email controler
  final _resetEmail = TextEditingController();

  //--- get email controller
  TextEditingController get resetEmail => _resetEmail;

  Future<void> startSendPasswordResetEmail(BuildContext context) async {
    try {
      if (_resetEmail.text.isNotEmpty) {
        //---start the loader
        setLoader = true;

        //----start creating the user account
        await AuthController.sendResetPassEmail(_resetEmail.text, context)
            .then((value) {
          AlertHelper.showAlert(context, "Email sent",
              "Please check your inbox", DialogType.success);
        });

        //----stop the loader
        setLoader = false;
      } else {
        //-----shows a error dialog
        AlertHelper.showAlert(context, "Validation error",
            "Fill all the fields", DialogType.error);
      }
    } catch (e) {
      Logger().e(e);
      //----stop the loader
      setLoader = false;
    }
  }
}
