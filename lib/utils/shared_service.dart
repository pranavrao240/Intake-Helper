import 'dart:convert';

import 'package:api_cache_manager/models/cache_db_model.dart';
import 'package:api_cache_manager/utils/cache_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:intake_helper/models/login_response_model.dart';

class SharedService {
  static const String KEY_NAME = "login_key";
  static Future<bool> isLoggedIn() async {
    var isCacheKeyExists = await APICacheManager().isAPICacheKeyExist(KEY_NAME);
    return isCacheKeyExists;
  }

  static Future<void> setLoginDetails(LoginResponseModel model) async {
    APICacheDBModel cacheDBModel =
        APICacheDBModel(key: KEY_NAME, syncData: jsonEncode(model.toJson()));

    await APICacheManager().addCacheData(cacheDBModel);
  }

  static Future<LoginResponseModel?> LoginDetails() async {
    var isCacheKeyExists = await APICacheManager().isAPICacheKeyExist(KEY_NAME);

    if (isCacheKeyExists) {
      var cacheData = await APICacheManager().getCacheData(KEY_NAME);

      return loginResponseJson(cacheData.syncData);
    }
    return null;
  }

  static Future<void> logout(BuildContext context) async {
    await APICacheManager().deleteCache(KEY_NAME);
    Navigator.pushNamedAndRemoveUntil(context, "/login", (route) => false);
  }
}
