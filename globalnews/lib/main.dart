import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../screens/homescreen.dart';
import '../darkmode/darkmode.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() async{
  await Future.delayed(const Duration(seconds: 3))
      .then((value) => FlutterNativeSplash.remove());
  runApp(const ProviderScope(child: MyApp()) );
  
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, ref) {
    var darkMode = ref.watch(darkModeProvider);
    return MaterialApp(
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      darkTheme: ThemeData.dark(),
      themeMode: darkMode ? ThemeMode.dark : ThemeMode.light,
     
    );
  }

  
}                