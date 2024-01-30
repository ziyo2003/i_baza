// class MySingleton{
//   static MySingleton? _instance;
//
//   MySingleton._internal();
//   factory MySingleton(){
//     if(_instance == null){
//       _instance = MySingleton._internal();
//     }
//     return _instance!;
//   }
// }
//

import 'package:shared_preferences/shared_preferences.dart';

class StorageRepository{
  static StorageRepository? _storageUtil;
  static SharedPreferences? _preferances;

  static Future<StorageRepository?> getInstance() async{
    if(_storageUtil == null){
      final secureStorage = StorageRepository._();
      await secureStorage._init();
      _storageUtil = secureStorage;
    }
    return _storageUtil;
  }
  StorageRepository._();

  Future _init() async{
    _preferances = await SharedPreferences.getInstance();
  }


  static bool getAuthStatus(){
    return _preferances?.getBool("isAuthenticated") ?? false;
  }
  static Future<bool?> setAuthStatus(bool value)async{
    return await _preferances?.setBool('isAuthenticated', value);
  }

  static setStatus(bool bool) {}
}