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
    await _preferences.setString( 'today', '' );
    await _preferences.setInt( 'run_count', 0 );
  } 

  static  Future<void> showValues() async {
    //final today = await _preferences.getString( 'today' );
    final run_count = await _preferences.getInt( 'run_count' );
    //Utils.log( filename, '$today - \n ${ run_count.toString() }');
    Utils.log( filename, '${ run_count.toString() }');
  }    

}