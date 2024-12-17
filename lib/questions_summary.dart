import 'package:flutter/material.dart';

import 'package:adv_basics/summary_item.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (data) {
              //final questionIndex = (data['question_index'] as int? ?? 0);
              return SummaryItem(
                data: data,
                isCorrectAnswer: ((data['user_answer'] as String) ==
                        (data['correct_answer'] as String)
                    ? true
                    : false),
              );
              // Row(
              //   children: [
              //     Text(
              //       questionIndex.toString(),
              //       style: const TextStyle(
              //         fontWeight: FontWeight.bold,
              //       ),
              //     ), //(data['question_index'] as String? ?? '0',),//(questionIndex.toString(),),
              //     const SizedBox(
              //       width: 20,
              //     ),
              //     Expanded(
              //       child: Column(
              //         children: [
              //           Text(
              //             data['question'] as String? ?? '',
              //             style: GoogleFonts.lato(
              //               color: Colors.white,
              //               fontSize: 16.0,
              //               fontWeight: FontWeight.bold,
              //             ),
              //           ),
              //           const SizedBox(
              //             height: 5,
              //           ),
              //           Text(
              //             data['user_answer'] as String? ?? '',
              //             style: const TextStyle(
              //               color: Color.fromARGB(255, 202, 171, 252),
              //             ),
              //           ),
              //           Text(
              //             data['correct_answer'] as String? ?? '',
              //             style: const TextStyle(
              //               color: Color.fromARGB(255, 202, 171, 252),
              //             ),
              //           ),
              //           const Padding(
              //             padding: EdgeInsets.symmetric(
              //               vertical: 10,
              //             ),
              //           ),
              //         ],
              //       ),
              //     ),
              //   ],
              // );
            },
          ).toList(),
        ),
      ),
    );
  }
}
