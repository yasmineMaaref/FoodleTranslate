import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

import '../models/Language.dart';

class TranslateInput extends StatefulWidget {
  TranslateInput({
    Key key,
    this.onCloseClicked,
    this.focusNode,
    this.firstLanguage,
    this.secondLanguage})
    : super(key: key);

  final Function(bool) onCloseClicked;
  final FocusNode focusNode;
  final Language firstLanguage;
  final Language secondLanguage;

  @override
  _TranslateInputState createState() => _TranslateInputState();
}

class _TranslateInputState extends State<TranslateInput> {
  String _textTranslated = "";
  GoogleTranslator _translator = new GoogleTranslator();
  TextEditingController _textEditingController = TextEditingController();

  _onTextChanged(String text) {
    if(text != "") {
      _translator.translate(
        text,
        from: this.widget.firstLanguage.code ?? 'default',
        to: this.widget.secondLanguage.code ?? ' default'
      ).then((translatedText) {
        this.setState(() {
          this._textTranslated = translatedText.toString() ;
        });
      });
    } else {
      this.setState(() {
        this._textTranslated = "";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.0,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 16.0),
              child: TextField(
                focusNode: this.widget.focusNode,
                controller: this._textEditingController,
                onChanged: this._onTextChanged,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  suffixIcon: RawMaterialButton(
                    onPressed: () {
                      if(this._textEditingController.text != null) {
                        this.setState(() {
                          this._textEditingController.clear();
                        });
                      } else {
                        this.widget.onCloseClicked(false);
                      }
                    },
                    child: new Icon(
                      Icons.close,
                      color: Colors.grey,
                    ),
                    shape: new CircleBorder(),
                  ),
                ),
              ),
            ),
          ),
          Divider(),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    this._textTranslated ?? 'default',
                    style: TextStyle(color: Colors.blue[700]),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}