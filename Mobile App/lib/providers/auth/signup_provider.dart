import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:soil_app/controllers/auth_controller.dart';
import 'package:soil_app/utils/alert_helper.dart';

class SignupProvider extends ChangeNotifier {
  //---email controler
  final _email = TextEditingController();

  //--- get email controller
  TextEditingController get emailController => _email;

  //---name controller
  final _name = TextEditingController();

//--- get name controller
  TextEditingController get nameController => _name;

  //---address controller
  final _address = TextEditingController();

//--- get name controller
  TextEditingController get addressController => _address;

//----password controller
  final _password = TextEditingController();

  //--- get password controller
  TextEditingController get passwordController => _password;

//----password controller
  final _mobile = TextEditingController();

  //--- get password controller
  TextEditingController get mobileController => _mobile;

  //----loading state
  bool _isLoading = false;

  //get loader state
  bool get isLoading => _isLoading;

  //-----set loading state
  set setLoader(bool val) {
    _isLoading = val;
    notifyListeners();
  }

  //----------signup fuction
  Future<void> startSignup(BuildContext context) async {
    try {
      if (_email.text.isNotEmpty &&
          _password.text.isNotEmpty &&
          _name.text.isNotEmpty &&
          _address.text.isNotEmpty &&
          _mobile.text.isNotEmpty) {
        //---start the loader
        setLoader = true;

        //----start creating the user account
        await AuthController().signupUser(_name.text, _email.text,
            _address.text, _password.text, _mobile.text, context);

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
