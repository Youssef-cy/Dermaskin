
class QuizQuestion {
  final String question;
  final List<String> options;

  const QuizQuestion({required this.question, required this.options});
}

const List<QuizQuestion> questions = [
  QuizQuestion(
    question: 'How does your skin feel after washing?\n(without products)',
    options: [
      'Very tight and dry',
      'Shiny and oily',
      'Oily in T-zone only',
      'Comfortable and balanced',
    ],
  ),
  QuizQuestion(
    question: 'How often does your face get shiny during the day?',
    options: [
      'Never',
      'Very often (whole face)',
      'Only forehead, nose, chin',
      'Rarely',
    ],
  ),
  QuizQuestion(
    question: 'How visible are your pores?',
    options: [
      'Very small',
      'Large everywhere',
      'Large in T-zone only',
      'Small to medium',
    ],
  ),
  QuizQuestion(
    question: 'How often do you get breakouts?',
    options: [
      'Rarely, but skin flakes',
      'Frequently everywhere',
      'Mostly in T-zone',
      'Very rarely',
    ],
  ),
  QuizQuestion(
    question: 'How does moisturizer usually feel?',
    options: [
      'Absorbs immediately',
      'Feels greasy',
      'Good on cheeks, heavy on T-zone',
      'Feels normal',
    ],
  ),
];
