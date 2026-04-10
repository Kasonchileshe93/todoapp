import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todoapp/pages/home_page.dart';

void main()  async {//async is used to wait for the initialization of hive before running the app
  //ensure that the Flutter framework is initialized
  WidgetsFlutterBinding.ensureInitialized();
  //initialize hive
  await Hive.initFlutter();//await is used to wait for the initialization of hive before running the app
  //open a box
  // ignore: unused_local_variable
  var box = await Hive.openBox('mybox');//open a box is used to create a box in hive where we can store our data

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

