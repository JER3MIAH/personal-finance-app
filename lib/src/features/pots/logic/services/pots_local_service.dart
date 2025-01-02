import 'dart:developer';

import 'package:personal_finance_app/src/features/pots/data/models/pot.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PotsLocalService {
  final SharedPreferences prefs;

  PotsLocalService({required this.prefs});

  Future<List<Pot>> getPots() async {
    try {
      List<String>? jsonList = prefs.getStringList('pot_list');
      if (jsonList == null) return [];

      return jsonList.map((json) => Pot.fromJson(json)).toList();
    } catch (e, stack) {
      log('error getting pots: $e at $stack');
      return [];
    }
  }

  Future<void> addNewPot(Pot pot) async {
    try {
      List<String>? existingJsonList = prefs.getStringList('pot_list');

      List<Pot> existing = existingJsonList != null
          ? existingJsonList.map((json) => Pot.fromJson((json))).toList()
          : [];

      if (!existing.any((b) => b.name == pot.name)) {
        existing = [pot, ...existing];
      }

      List<String> updatedJsonList =
          existing.map((preset) => preset.toJson()).toList();
      await prefs.setStringList('pot_list', updatedJsonList);
    } catch (e, stack) {
      log('error creating pot: $e at $stack');
    }
  }

  Future<void> editPot(Pot updatedPot) async {
    try {
      List<String>? jsonList = prefs.getStringList('pot_list');

      if (jsonList != null) {
        List<Pot> existing = jsonList.map((json) {
          return Pot.fromJson(json);
        }).toList();

        int index = existing.indexWhere((pot) => pot.name == updatedPot.name);

        if (index != -1) {
          existing[index] = updatedPot;
        }

        List<String> updatedJsonList =
            existing.map((pot) => pot.toJson()).toList();
        await prefs.setStringList('pot_list', updatedJsonList);
      }
    } catch (e, stack) {
      log('error editing pot: $e at $stack');
    }
  }

  Future<void> removePot(String potName) async {
    try {
      List<String>? jsonList = prefs.getStringList('pot_list');

      if (jsonList != null) {
        List<Pot> existing =
            jsonList.map((json) => Pot.fromJson(json)).toList();

        existing.removeWhere((pot) => pot.name == potName);

        List<String> updatedjsonList =
            existing.map((pot) => pot.toJson()).toList();
        await prefs.setStringList('pot_list', updatedjsonList);
      }
    } catch (e, stack) {
      log('error removing pot: $e at $stack');
    }
  }
}
