import 'package:authentification/Start.dart';
import 'package:authentification/quiz/page/QuizzHomePage.dart';
import 'package:authentification/recognition/Recognition.dart';
import 'package:authentification/translate/screens/translateHomePage.dart';
import 'package:authentification/voice/speech.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:authentification/Start.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'quiz/page/category_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User user;
  bool isloggedin = false;

  checkAuthentification() async {
    _auth.authStateChanges().listen((user) {
      if (user == null) {
        Navigator.of(context).pushReplacementNamed("start");
      }
    });
  }

  getUser() async {
    User firebaseUser = _auth.currentUser;
    await firebaseUser?.reload();
    firebaseUser = _auth.currentUser;

    if (firebaseUser != null) {
      setState(() {
        this.user = firebaseUser;
        this.isloggedin = true;
      });
    }
  }

  signOut() async {
    _auth.signOut();

    final googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
  }


  @override
  void initState() {
    super.initState();
    this.checkAuthentification();
    this.getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: !isloggedin
          ? CircularProgressIndicator()
          : Column(
              children: <Widget>[
      Align(
      alignment: Alignment.centerLeft, ),
                SizedBox(height: 40.0),
          Container(
            margin: const EdgeInsets.only( left: 230.0 ),
            child:
                RaisedButton(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  onPressed: signOut,
                  child: Text('Signout',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold)),
                  color: Colors.orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
          ),
                Container(
                  height: 290,
                  child: Image(
                    image: AssetImage("images/welcome.jpg"),
                    fit: BoxFit.contain,

                  ),
                ),
                Container(
                  child: Text(
                    //${user.displayName}
                    "Hello you are Logged in as ${user.email}",
                    style:
                        TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
                  ),
                ),
               Row(
        children: <Widget>[
        Align(
          alignment: Alignment.bottomRight, ),
      SizedBox(height: 80.0),
                Container(
                  margin: const EdgeInsets.only( right: 10.0 ),
                  child:
                  RaisedButton(
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => translateHomePage()),
                      );
                  },
                    child: Text('Translate text',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold)),
                    color: Colors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),



                Container(
                 // margin: const EdgeInsets.only( left: 50.0 ),
                  child:
                  RaisedButton(
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    onPressed: () {
    Navigator.push(
    context,
    MaterialPageRoute(
    builder: (context) => QuizzHomePage()),
    );

                    },
                    child: Text('Take a Quizz',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold)),
                    color: Colors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),

                ]
               ),
          Row(
            children: <Widget>[
              Align(
                alignment: Alignment.bottomRight, ),
              SizedBox(height: 100.0),
                Container(
                  //margin: const EdgeInsets.only( left: 230.0 ),
                  child:
                  RaisedButton(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    onPressed : () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Recognition()),
                      );
                    },

                    child: Text('CamRecognition',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold)),
                    color: Colors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
                Container(
                  //margin: const EdgeInsets.only( left: 230.0 ),
                  child:
                  RaisedButton(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    onPressed : () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SpeechScreen()),
                      );
                    },
                    child: Text('VoiceRecognition',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold)),
                    color: Colors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
              ],
            ),
        ]
    )));
  }
}
