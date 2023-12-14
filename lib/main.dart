import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sorting_algorithms_visualization/src/app.dart';
import 'package:sorting_algorithms_visualization/src/infrastructure/repository/settings_repository_impl.dart';

void main() async {
  final prefs = await SharedPreferences.getInstance();
  final settingsRepository = SettingsRepositoryImpl(prefs: prefs);
  runApp(App(
    settingsRepository: settingsRepository,
  ));
}
