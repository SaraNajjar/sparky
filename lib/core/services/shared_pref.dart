import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SharedPrefs {

  static late SharedPreferences _sharedPrefs;

  factory SharedPrefs() => SharedPrefs._internal();

  SharedPrefs._internal();


  Future<void> init() async {
    _sharedPrefs = await SharedPreferences.getInstance();
  }


  setTheme(String? value) {
    _sharedPrefs?.setString(selectedTheme, value!);
  }

  static const String selectedTheme = "theme";

  static Future<bool> setString(String key, String value) async =>
      await _sharedPrefs.setString(key, value);


  static String? getString(String key){
    return _sharedPrefs.getString(key);
  }
  static dynamic getDta({
    required String key,
  }){
    return  _sharedPrefs.get(key);
  }
  static Future<bool> saveData({
    required String key,
    required dynamic value
  })async{

    if(value is String) return await _sharedPrefs.setString(key, value);
    if(value is int) return await _sharedPrefs.setInt(key, value);
    if(value is bool) return await _sharedPrefs.setBool(key, value);
    return await _sharedPrefs.setDouble(key, value);
  }
  static Future<bool?> removeData({
    required String key,
  })async{
    return await _sharedPrefs.remove(key, );

  }
  Future<bool> saveToken(String token)async {
    return await _sharedPrefs.setString('token', token);
  }
  static const CACHED_USERS = "CACHED_USERS";
  static const CACHED_CARD = "CACHED_CARD";

  String get theme=>_sharedPrefs?.getString('theme')??'system';

  String get token => _sharedPrefs.getString('token')??'';

}