import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.switchScreen, {super.key});

  final void Function() switchScreen; //VoidCallback switchScreen;//

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
            Image.asset(
              'assets/Images/quiz_logo.png',
              width: 300,
              color: const Color.fromARGB(150, 255, 255, 255),
            ),
          // Opacity(
          //   opacity: 0.6,
          //   child: Image.asset(
          //     'assets/Images/quiz_logo.png',
          //     width: 300,
          //   ),
          // ),
          const SizedBox(height: 80,),
         Text(
            'Learn Flutter the fun way!',
            style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 201, 153, 251),
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
          ),
          const SizedBox(height: 30,),

          OutlinedButton.icon(
            onPressed: switchScreen,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text(
              'Start Quiz'
            ),
          ),
          // OutlinedButton(
          //   onPressed: () {}, 
          //   style: OutlinedButton.styleFrom(
          //     foregroundColor: Colors.white,
          //     //backgroundColor: Colors.transparent
          //   ),
          //   child: const Text(
          //     'Start Quiz'
          //   ),
          // ),
        ],
      ),
    );
  }
}