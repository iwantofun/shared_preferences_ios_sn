/**
 * @Author: iwantofun@gmail.com
 */
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_platform_interface/shared_preferences_platform_interface.dart';

import 'method_channel_shared_preferences_sn.dart';
export 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';

class SPUtil{

  static Future<SharedPreferences> withSuitName(String name){
    if (Platform.isIOS && name!=''){
      SharedPreferencesStorePlatform.instance = MethodChannelSharedPreferencesStoreSN(name);
    }
    return SharedPreferences.getInstance();
  }
  
}
