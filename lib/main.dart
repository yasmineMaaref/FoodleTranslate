import 'package:authentification/Login.dart';
import 'package:authentification/SignUp.dart';
import 'package:authentification/Start.dart';
import 'package:authentification/quiz/page/QuizzHomePage.dart';
import 'package:authentification/recognition/Recognition.dart';
import 'package:authentification/translate/screens/translateHomePage.dart';
import 'package:authentification/voice/speech.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'HomePage.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
   runApp(MyApp());
   }

class MyApp extends StatelessWidget {
  static final String title = 'Quiz App';

  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      theme: ThemeData(
        //primaryColor: Colors.orange
        primarySwatch: Colors.deepOrange
      ),
      debugShowCheckedModeBanner: false,
      title: title,

      home: 
    
      HomePage(),

      routes: <String,WidgetBuilder>{

        "Login" : (BuildContext context)=>Login(),
        "SignUp":(BuildContext context)=>SignUp(),
        "start":(BuildContext context)=>Start(),
        "HomePage":(BuildContext context)=>HomePage(),
        "QuizzHomePage()":(BuildContext context)=>QuizzHomePage(),
        "translateHomePage":(BuildContext context)=>translateHomePage(),
        "SpeechScreen":(BuildContext context)=>SpeechScreen(),
        "Recognition":(BuildContext context)=>Recognition()

      },
      
    );
  }

}



