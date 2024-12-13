import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:adv_basics/answer_button.dart';
import 'package:adv_basics/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectAnswer,});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {
    // currentQuestionIndex += 1;
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
          currentQuestionIndex++;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40,),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,  // vertical alignment
          crossAxisAlignment: CrossAxisAlignment.stretch,  //horizontal alignment
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 201, 153, 251),
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            ...currentQuestion.getShuffledAnswers().map((answer) {
              return AnswerButton(answerText: answer, onTap: () {
                  answerQuestion(answer);
              },
              );
            }),
            // ...currentQuestion.answers.map((answer) {
            //   return AnswerButton(answerText: answer, onTap: () {},);
            // }),
            // AnswerButton(answerText: currentQuestion.answers[0], onTap: () {}),
          ],
        ),
      ),
    );
  }
}
