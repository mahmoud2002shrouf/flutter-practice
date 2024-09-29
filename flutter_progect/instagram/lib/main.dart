import "package:flutter/material.dart";
import "package:instagram/responseve/mobile_screen.dart";
import "package:instagram/responseve/responseve.dart";
import "package:instagram/responseve/web_screen.dart";
import "package:instagram/utils/color.dart";
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
void main() async{
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const Main());
}
class Main extends StatelessWidget {
const Main({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: "instagram",
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: mobileBackgroundColor),
      home:  const Responseve(mobileScreen: MobileScreen(),webScreen: WebScreen(),),
    );
  }
}