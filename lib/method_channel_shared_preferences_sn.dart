// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';

import 'package:flutter/services.dart';

import 'package:shared_preferences_platform_interface/shared_preferences_platform_interface.dart';

const MethodChannel _kChannel =
    MethodChannel('plugins.flutter.io/shared_preferences_sn');

/// Wraps NSUserDefaults (on iOS) and SharedPreferences (on Android), providing
/// a persistent store for simple data.
///
/// Data is persisted to disk asynchronously.
class MethodChannelSharedPreferencesStoreSN
    extends SharedPreferencesStorePlatform {

  final String _suiteName;
  MethodChannelSharedPreferencesStoreSN(this._suiteName);

  @override
  Future<bool> remove(String key) async {
    return (await _kChannel.invokeMethod<bool>(
      'remove',
      <String, dynamic>{'key': key,'suiteName':this._suiteName},
    ))!;
  }

  @override
  Future<bool> setValue(String valueType, String key, Object value) async {
    return (await _kChannel.invokeMethod<bool>(
      'set$valueType',
      <String, dynamic>{'key': key, 'value': value,'suiteName':this._suiteName},
    ))!;
  }

  @override
  Future<bool> clear() async {
    return (await _kChannel.invokeMethod<bool>('clear',<String, dynamic>{'suiteName':this._suiteName}))!;
  }

  @override
  Future<Map<String, Object>> getAll() async {
    final Map<String, Object>? preferences =
        await _kChannel.invokeMapMethod<String, Object>('getAll',<String, dynamic>{'suiteName':this._suiteName});

    if (preferences == null) {
      return <String, Object>{};
    }
    return preferences;
  }
}
