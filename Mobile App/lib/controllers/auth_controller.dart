import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';
import 'package:soil_app/controllers/file_upload_controller.dart';
import 'package:soil_app/models/user_model.dart';
import 'package:soil_app/utils/alert_helper.dart';
import 'package:soil_app/utils/assets_constant.dart';

class AuthController {
//----signup user
  Future<void> signupUser(String name, String email, String address,
      String password, String mobile, BuildContext context) async {
    try {
      //----start creating the user in the firebase console
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      //----------check user object is not null
      if (credential.user != null) {
        //------save extra user data in firestore cloud
        saveUserData(credential.user!.uid, name, email, address, mobile);
      }
      Logger().i(credential);
    } on FirebaseAuthException catch (e) {
      Logger().e(e.code);
      AlertHelper.showAlert(context, "Error", e.code, DialogType.error);
    } catch (e) {
      Logger().e(e);
      AlertHelper.showAlert(context, "Error", e.toString(), DialogType.error);
    }
  }

  //--------============================saving user data in cloud firestore======================
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Create a CollectionReference called users that references the firestore collection
  CollectionReference users = FirebaseFirestore.instance.collection('users');

//----save extra user data in firestore
  Future<void> saveUserData(
    String uid,
    String name,
    String email,
    String address,
    String mobile,
  ) {
    return users
        .doc(uid)
        .set(
          {
            'uid': uid,
            'name': name,
            'email': email,
            'address': address,
            'phone': mobile,
            'img': AssetsConstant.profileImg,
          },
        )
        .then((value) => Logger().i("Successfully added"))
        .catchError((error) => Logger().e("Failed to merge data: $error"));
  }

//---fetch userdata from cloudfirestore

  Future<UserModel?> fetchUserData(String uid) async {
    try {
      //----------------firebase query that find and fetch user data according to the uid
      DocumentSnapshot documentSnapshot = await users.doc(uid).get();
      Logger().i(documentSnapshot.data());

      //---mapping fetched data user data into usermodel
      UserModel model =
          UserModel.fromJason(documentSnapshot.data() as Map<String, dynamic>);

      return model;
    } catch (e) {
      Logger().e(e);
      return null;
    }
  }

  //----login user
  static Future<void> loginUser(
      String email, String password, BuildContext context) async {
    try {
      //----start login in the user in the firebase console
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      Logger().d(credential);
    } on FirebaseAuthException catch (e) {
      Logger().e(e.code);
      AlertHelper.showAlert(context, "Error", e.code, DialogType.error);
    } catch (e) {
      Logger().e(e);
      AlertHelper.showAlert(context, "Error", e.toString(), DialogType.error);
    }
  }

//----reset password email
  static Future<void> sendResetPassEmail(
      String email, BuildContext context) async {
    try {
      //----start sending apassword reset email
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      Logger().e(e.code);
      AlertHelper.showAlert(context, "Error", e.code, DialogType.error);
    } catch (e) {
      Logger().e(e);
      AlertHelper.showAlert(context, "Error", e.toString(), DialogType.error);
    }
  }

  //------signout user
  static Future<void> signOutUser() async {
    await FirebaseAuth.instance.signOut();
  }

//===================================upload user image
  final FileUploadController _fileUploadController = FileUploadController();

//---------upload picked image file to firebase storage
  Future<String> uploadAndUpdatePickedImage(File file, String uid) async {
    try {
      //------first upload and get the download link of he picked file
      String downloadUrl =
          await _fileUploadController.uploadFile(file, "profileImages");

      if (downloadUrl != "") {
        //------updating the uploaded file download url in the user data
        await users.doc(uid).update(
          {
            'img': downloadUrl,
          },
        );
        return downloadUrl;
      } else {
        Logger().e("download url is empty");
        return "";
      }
    } catch (e) {
      Logger().e(e);
      return "";
    }
  }
}
