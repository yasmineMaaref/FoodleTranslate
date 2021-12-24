import '../model/option.dart';
import '../model/question.dart';

final questions = [
  Question(
    text: 'What does the word “embarazada” mean?',
    options: [
      Option(code: 'A', text: 'embarrassed, object', isCorrect: false),
      Option(code: 'B', text: 'embarrassed, ashamed', isCorrect: true),
      Option(code: 'C', text: 'pregnant', isCorrect: false),
      Option(code: 'D', text: 'embarquée', isCorrect: false),
    ],
    solution: 'embarrassed, confused, ashamed',
  ),
  Question(
    text: 'Which word means "although"?',
    options: [
      Option(code: 'A', text: 'sin embargo', isCorrect: false),
      Option(code: 'B', text: 'aunque', isCorrect: false),
      Option(code: 'C', text: 'pues', isCorrect: false),
      Option(code: 'D', text: 'entonces', isCorrect: true),
    ],
    solution: ' entonces',
  ),
  Question(
    text: 'Mi balcón da (…) on',
    options: [
      Option(code: 'A', text: 'al', isCorrect: false),
      Option(code: 'B', text: 'en', isCorrect: false),
      Option(code: 'C', text: 'sobre', isCorrect: false),
      Option(code: 'D', text: 'dal', isCorrect: true),
    ],
    solution: 'al',
  ),
  Question(
    text:
        'Which of the following expressions does not express an opinion?',
    options: [
      Option(code: 'A', text: 'me parece que…', isCorrect: true),
      Option(code: 'B', text: 'no me parece acertado…', isCorrect: false),
      Option(code: 'C', text: "me ha conmovido…", isCorrect: false),
      Option(code: 'D', text: "no me acaba de convencer…", isCorrect: false),
    ],
    solution: 'me ha conmovido…',
  ),
  Question(
    text: 'What are the "tópicos"?',
    options: [
      Option(code: 'A', text: 'des chips épicés', isCorrect: false),
      Option(code: 'B', text: 'the subjects of the exams', isCorrect: false),
      Option(code: 'C', text: 'the objects of study', isCorrect: true),
      Option(code: 'D', text: 'common places', isCorrect: false),
    ],
    solution: 'common places',
  ),
  Question(
    text: 'Pedir que is always followed:',
    options: [
      Option(code: 'A', text: 'subjunctive', isCorrect: false),
      Option(code: 'B', text: 'imperative', isCorrect: false),
      Option(code: 'C', text: 'Calcium', isCorrect: true),
      Option(
        code: 'D',
        text: 'imperative',
        isCorrect: false,
      ),
    ],
    solution: 'imperative',
  ),
  Question(
    text: '“Como si” is always followed:',
    options: [
      Option(code: 'A', text: 'Brazil', isCorrect: false),
      Option(code: 'B', text: 'Germany', isCorrect: false),
      Option(code: 'C', text: 'Italy', isCorrect: false),
      Option(code: 'D', text: 'Uruguay', isCorrect: true),
    ],
    solution: 'Uruguay was the first country to win world cup',
  ),
];
