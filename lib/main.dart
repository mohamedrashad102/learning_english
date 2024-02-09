import 'package:flutter/material.dart';
import 'package:learning_english/common/constants/routes.dart';
import 'package:learning_english/common/services/local_data.dart';
import 'package:learning_english/common/services/stt_service.dart';
import 'package:learning_english/views/home_view/home_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  STTService.initialize();
  await LocalData.readData();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      routes: appRoutes,
      initialRoute: HomeView.id,
      // home: const Scaffold(),
    );
  }
}
