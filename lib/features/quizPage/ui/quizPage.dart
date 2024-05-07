import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:quiz_app/features/quizPage/bloc/quiz_bloc.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  QuizBloc quizBloc = QuizBloc();

  @override
  void initState() {
 quizBloc.add(QuizInitialEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

