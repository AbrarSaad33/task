import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:task1/screen/first_screen.dart';
import 'package:task1/screen/second_screen.dart';
import 'package:task1/providers/prisoners.dart';

void main() {
  runApp(MyHomePage());
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Prisoners(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // Application name

        // Application theme data, you can set the colors for the application as
        // you want
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.grey[300],
          primarySwatch: Colors.grey,
        ),
        home: FirstScreen(),
        routes: {SecondScreen.routeName: (ctx) => SecondScreen()},
      ),
    );
  }
}
