import 'package:flutter/material.dart';
import 'package:i_baza/core/adaptor/hive_type_adaptor.dart';
import 'package:i_baza/core/data_base/objectBox.dart';
import 'package:i_baza/features/presintation/pages/login_screen/login_screen.dart';
import 'core/injector/setup_locator/setup_locator.dart';
import 'core/injector/stage_repository/storage_repository.dart';

void main() async {
  registerAdapters();
  WidgetsFlutterBinding.ensureInitialized();
  await StorageRepository.getInstance();
  await HiveRepository.getInstance();
  await LocalDataBase.getInstance();


  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  void _increment() async {
    await StorageRepository.setStatus(true);
    await HiveRepository.putName();
  }


  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}