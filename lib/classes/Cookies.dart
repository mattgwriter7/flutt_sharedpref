import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import "./Config.dart";
import 'Utils.dart';

class Cookies {
  static String filename = 'Cookies.dart';
  static late SharedPreferences _preferences;

  static Future init() async =>
    _preferences = await SharedPreferences.getInstance();
  
  //  String Manipulation
  static Future setStr(String key, String value) async {
    await _preferences.setString( key, value );
  }  
  static  Future<String> getStr( String key ) async {
    final str = _preferences.getString( key );
    return str == null ? 'nada' : str;
  }     

  //  String Array Manipulation
  static Future setList(String key, List<String> value) async {
    await _preferences.setStringList( key, value );
  }  
  static  Future<List<String>> getList( String key ) async {
    final str_list = _preferences.getStringList( key );
    return str_list == null ? [] : str_list;
  } 

  //  Numeric Manipulation
  static Future setNum(String key, int num) async {
    await _preferences.setInt( key, num );
  } 

  static  Future<int> getNum( String key ) async {
    final num = _preferences.getInt( key );
    return num == null ? 0 : num;
  }   

  //  Other stuff
  static Future reset() async {
    await _preferences.remove('today');
    await _preferences.remove('run_count');
    await _preferences.remove('app');
    Utils.log( filename, 'reset()');
    return;
  } 

  static  Future<void> showValues() async {
    String values = '';
    values =  await _preferences.getStringList( 'app' ).toString() + '\n';
    Utils.log( filename, 'showValues() -> ${ values }');
    return;
  }    

}