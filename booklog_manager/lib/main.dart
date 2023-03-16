import 'package:flutter/material.dart';
import 'package:booklog_manager/bottom_tab.dart';
import 'package:booklog_manager/settings_manager.dart';
import 'package:booklog_manager/database_manager.dart';
import 'package:booklog_manager/package_info_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SettingsManager().initAsync();
  await DatabaseManager().initAsync();
  await PackageInfoManager().initAsync();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Booklog Manager',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BottomTab(),
    );
  }
}
