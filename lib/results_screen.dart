import 'package:flutter/material.dart';

import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/questions_summary.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultsScreen extends StatelessWidget{
const ResultsScreen({
  super.key, 
  required this.chosenAnswers,
  required this.onRestart
  });
  
  final void Function() onRestart;
  final List<String> chosenAnswers;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      //loop body
      summary.add({
        'question_index' : i + 1,
        'question' : questions[i].text,
        'correct_answer' : questions[i].answers[0],
        'user_answer' : chosenAnswers[i]
      },
      );
    }

    return summary;
  }

  @override
  Widget build(context) {
    final summaryData = getSummaryData();
final numTotalQuestions = questions.length;
final numofCorrectQuestions = summaryData.where((data) {
  return data['user_answer'] == data['correct_answer'];
}).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40,),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,  // vertical alignment
          // crossAxisAlignment: CrossAxisAlignment.start,  //horizontal alignment
          children: [
            
             Text('You answered $numofCorrectQuestions out of $numTotalQuestions questions correctly!',
             style: GoogleFonts.lato(
              color: const Color.fromARGB(255, 230, 200, 253),
              fontSize: 20.0,
              fontWeight: FontWeight.bold
              ),
              textAlign: TextAlign.center,
             ),
             const SizedBox(height: 30,),
             QuestionsSummary(summaryData),
             const SizedBox(height: 30,),
             TextButton(
              style: TextButton.styleFrom(
              foregroundColor: Colors.white,
                ),
              onPressed: onRestart, 
              child: const Text(
                'Restart Quiz!',
                ),
             ),
                
      ],
        ),
      ),
    );
  } 
  
}