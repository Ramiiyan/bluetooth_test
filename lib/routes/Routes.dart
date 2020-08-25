import 'package:bluetooth_test/MyHomePage.dart';
import 'package:flutter/cupertino.dart';
// import 'package:smartsocketapp/AddDevice.dart';
// import 'package:smartsocketapp/PairDevice.dart';
// import 'package:smartsocketapp/PairProgress.dart';
// import 'package:smartsocketapp/UserProfile.dart';
// import 'package:smartsocketapp/ShareDevice.dart';
// import 'package:smartsocketapp/welcome.dart';

// import '../ChangePassword.dart';
// import '../SharePermission.dart';
// import '../WifiSetup.dart';
// import '../WifiSetupInfo.dart';
// import '../home.dart';
// import '../login.dart';
// import '../resetPassword.dart';
// import '../signup.dart';

class Routes {
  static const String myhomePage = '/';
  static const String wifiSetupInfo = '/wifiSetupInfo';
  static const String wifiSetup = '/wifiSetup';
  static const String chatpage = '/chatpage';
  static const String deviceView = '/device';
  static const String addDevice = '/addDevice';
  static const String shareDevice = '/shareDevice';
  static const String sharePermission = '/sharePermission';
  static const String pairDevice = '/pairDevice';
  static const String pairProgress = '/pairProgress';
  static const String userProfile = '/userProfile';
  static const String changePassword = '/changePassword';

  static var cutomRoutes = <String, WidgetBuilder>{
    myhomePage:(BuildContext context) => MyHomePage(),
    // login : (BuildContext context) => LoginPage(),   
    // signup : (BuildContext context) => SignUpPage(),
    // resetPwd : (BuildContext context) => ResetPasswordPage(),
    // wifiSetupInfo : (BuildContext context) => WifiSetupInfoPage(),   
    // wifiSetup : (BuildContext context) => WifiSetupPage(),
    // home : (BuildContext context) => HomePage(),
    // addDevice : (BuildContext context) => AddDevicePage(),
    // shareDevice : (BuildContext context) => ShareDevicePage(),
    // sharePermission : (BuildContext context) => SharePermissionPage(),
    // pairDevice : (BuildContext context) => PairDevicePage(),
    // pairProgress : (BuildContext context) => PairProgressPage(),
    // userProfile : (BuildContext context) => UserProfilePage(),
    // changePassword : (BuildContext context) => ChangePasswordPage(),

  };
}