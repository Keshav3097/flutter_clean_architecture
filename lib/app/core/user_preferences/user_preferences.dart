import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static SharedPreferences? _pref;

  static Future<void> _init() async {
    _pref ??= await SharedPreferences.getInstance();
  }

  static void setLogged(bool isLogged) async {
    await _init();
    await _pref?.setBool(_isLogged, isLogged);
  }

  static Future<bool> getLogged() async {
    await _init();
    return _pref!.getBool(_isLogged) ?? true;
  }

  static Future<bool> setUserName(String name) async {
    await _init();
    return await _pref!.setString(userName, name);
  }

  static Future<String> getUserName() async {
    await _init();
    return _pref!.getString(userName) ?? "";
  }

  static void setUserEmail(String email) async {
    await _init();
    await _pref?.setString(userEmail, email);
  }

  static Future<String> getUserEmail() async {
    await _init();
    return _pref!.getString(userEmail) ?? "";
  }

  static void setUserPhoto(String photo) async {
    await _init();
    await _pref?.setString(userPhoto, photo);
  }

  static Future<String> getUserPhoto() async {
    await _init();
    return _pref!.getString(userPhoto) ?? "";
  }

  static Future<bool> setEmployeeCode(int employeeCodee) async {
    await _init();
    return await _pref!.setInt(employeeCode, employeeCodee);
  }

  static Future<int> getEmployeeCode() async {
    await _init();
    return _pref!.getInt(employeeCode) ?? 0;
  }

  static Future<bool> setUserToken(String token) async {
    await _init();
    return await _pref!.setString(userToken, token);
  }

  static Future<String> getUserToken() async {
    await _init();
    return _pref!.getString(userToken) ?? "";
  }
  static Future<bool> setQueryId(String queryIdI) async {
    await _init();
    return await _pref!.setString(queryId, queryIdI);
  }
  static Future<String> getQueryId() async {
    await _init();
    return _pref!.getString(queryId) ?? "";
  }

  static Future<bool> setRegionalInfo(String info) async {
    await _init();
    return await _pref!.setString(regionalInfo, info);
  }

  static Future<String> getRegionalInfo() async {
    await _init();
    return _pref!.getString(regionalInfo) ?? "";
  }

  static clearStorage() async {
    await _init();
    await _pref?.clear();
  }

  static const String _isLogged = "isLogged";
  static const String userToken = "userToken";
  static const String queryId = "queryId";
  static const String regionalInfo = "regionalInfo";
  static const String userName = "userName";
  static const String employeeCode = "employeeCode";
  static const String userEmail = "userEmail";
  static const String userPhoto = "userPhoto";

}