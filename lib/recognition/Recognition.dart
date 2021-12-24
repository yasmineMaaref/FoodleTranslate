import 'dart:async';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobile_vision/flutter_mobile_vision.dart';
import 'package:translator/translator.dart';


class Recognition extends StatefulWidget {
  @override
  _RecognitionState createState() => _RecognitionState();


}

class _RecognitionState extends State<Recognition> {
  int _cameraOcr = FlutterMobileVision.CAMERA_BACK;
  String _textValue = "sample";
  String out;

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(
        primarySwatch: Colors.deepOrange,
        buttonColor: Colors.redAccent,
      ),
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Flutter Mobile Vision'),
        ),
        body: Center(
            child: new ListView(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new Text(_textValue,textAlign: TextAlign.center,style: TextStyle(fontSize: 20,),),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(100,10,100,0),
                  child: new RaisedButton(color: Colors.yellow,
                    onPressed: _read,
                    child: new Text('Start Scanning'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(70,10,70,0),
                  child: new RaisedButton(color: Colors.cyan,
                    onPressed: (){trans('hi');},
                    child: new Text('Translate to Hindi'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(70,10,70,0),
                  child: new RaisedButton(color: Colors.teal,
                    onPressed: (){trans('mr');},
                    child: new Text('Translate to Marathi'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(70,10,70,0),
                  child: new RaisedButton(color: Colors.green[200],
                    onPressed:(){trans('zh-cn');},
                    child: new Text('Translate to Chinese'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(70,10,70,0),
                  child: new RaisedButton(color: Colors.purple[500],
                    onPressed:(){trans('gu');},
                    child: new Text('Translate to Gujarati'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(70,10,70,0),
                  child: new RaisedButton(
                    onPressed:(){trans('fr');},
                    child: new Text('Translate to French'),
                  ),
                ),
                SizedBox(height: 20,),
                Center(child: Text(out.toString(),style: TextStyle(fontSize: 25),))
              ],
            )),
      ),
    );
  }

  Future<Null> _read() async {
    List<OcrText> texts = [];
    try {
      texts = await FlutterMobileVision.read(
        camera: _cameraOcr,
        waitTap: true,
      );

      setState(() {
        _textValue = texts[0].value;
      });
    } on Exception {
      texts.add(new OcrText('Failed to recognize text.'));
    }
  }

  void trans(String lang) {
    GoogleTranslator translator = new GoogleTranslator();
    translator.translate(_textValue, to: '$lang') //translating to hi = hindi
        .then((output) {
      setState(() {
        out = output.toString(); //placing the translated text to the String to be used
      });
      print(out);
    });
  }
}