import 'package:flutter/material.dart';
import 'package:shared_preference/Login.dart';
import 'package:shared_preference/Screen1.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future<bool?> getData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isChecked = prefs.getBool("isRemember");
    print(isChecked);
    return isChecked;
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool?>(
      future: getData(),
      builder: (context, snapshot) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: snapshot.hasData ? Screen1() : Login(),
        );
      },
    );
  }
}
