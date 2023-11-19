import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:ulearning_app/common/models/entities.dart';
import 'package:ulearning_app/common/utils/constants.dart';

class StorageService {
  late final SharedPreferences _pref;

  Future<StorageService> int() async {
    _pref = await SharedPreferences.getInstance();
    return this;
  }

  Future<bool> setString(String key, String value) async {
    return await _pref.setString(key, value);
  }

  String getString(String key){
    return _pref.getString(key)??"";
  }

  setBool(String key, bool value) async {
    return await _pref.setBool(key, value);
  }

  bool getDeviceFirstOpen() {
    return _pref.getBool(AppConstants.STORAGE_DEVICE_OPEN_FIRST_KEY) ?? false;
  }

  bool isLoggedIn() {
    return _pref.getString(AppConstants.STORAGE_USER_PROFILE_KEY) != null
        ? true
        : false;
  }

 UserProfile getUserProfile(){
    var profile = _pref.getString(AppConstants.STORAGE_USER_PROFILE_KEY)??"";
    var profileJson = jsonDecode(profile);
    var userProfile = UserProfile.fromJson(profileJson);
    return userProfile;
  }
}
