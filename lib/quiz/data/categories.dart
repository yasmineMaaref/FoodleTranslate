import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:authentification/quiz//data/questions.dart';
import 'package:authentification/quiz//model/category.dart';

final categories = <Category>[
  Category(
    questions: questions,
    categoryName: 'Spanish',
    imageUrl: '../assets/esp.png',
    backgroundColor: Colors.blue,
    icon: FontAwesomeIcons.rocket,
    description: 'Practice questions from various chapters in physics',
  ),
  Category(
    questions: questions,
    imageUrl: '../assets/english.png',
    categoryName: 'English',
    backgroundColor: Colors.orange,
    icon: FontAwesomeIcons.atom,
    description: 'Practice questions from various chapters in chemistry',
  ),
  Category(
    questions: questions,
    imageUrl: '../assets/fr.png',
    categoryName: 'Frensh',
    backgroundColor: Colors.purple,
    icon: FontAwesomeIcons.squareRootAlt,
    description: 'Practice questions from various chapters in maths',
  ),
  Category(
    questions: questions,
    imageUrl: '../assets/german.png',
    categoryName: 'German',
    backgroundColor: Colors.lightBlue,
    icon: FontAwesomeIcons.dna,
    description: 'Practice questions from various chapters in biology',
  ),
];
