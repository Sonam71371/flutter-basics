import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem({
    super.key,
    required this.data,
    required this.isCorrectAnswer,
  });

  final Map<String, Object> data;
  final bool isCorrectAnswer;

  @override
  Widget build(context) {
    final questionIndex = (data['question_index'] as int? ?? 0);
    return Row(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 30, // Set a fixed width and height for uniformity
          height: 30,
          alignment: Alignment.center, // Center the text inside the container
          decoration: BoxDecoration(
            color: isCorrectAnswer
                ? const Color.fromARGB(255, 150, 198, 241)
                : const Color.fromARGB(255, 249, 133, 241),
            borderRadius: BorderRadius.circular(100),
            // Circular border for rounded effect
          ),
          child: Text(
            questionIndex.toString(),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 22, 2, 56),
            ),
          ),
        ), //(data['question_index'] as String? ?? '0',),//(questionIndex.toString(),),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data['question'] as String? ?? '',
                style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
                textDirection: TextDirection.ltr,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                data['user_answer'] as String? ?? '',
                style: const TextStyle(
                  color: Color.fromARGB(255, 158, 10, 158),
                ),
                textAlign: TextAlign.left,
              ),
              Text(
                data['correct_answer'] as String? ?? '',
                style: const TextStyle(
                  color: Color.fromARGB(255, 8, 127, 113),
                ),
                textAlign: TextAlign.left,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 10,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
