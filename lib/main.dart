import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:whatsapp/Screens/home.dart';
import 'package:whatsapp/page/camera.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: const Color(0xFF075E54),
        useMaterial3: false,
        fontFamily: "OpenSans",
        //accentColor: Color(0xFF128C7E), // Corrected property name
      ),
      home: const Home(),
    );
  }
}
