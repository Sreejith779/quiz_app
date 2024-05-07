import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    return BlocConsumer<QuizBloc, QuizState>(
      bloc: quizBloc,
      listenWhen: (previous, current) => current is QuizActionState,
      buildWhen: (previous, current) => current is! QuizActionState,
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case QuizLoadedState:
            final loadedState = state as QuizLoadedState;
            return Scaffold(
                appBar: AppBar(
                  title: const Text("Quiz"),
                ),
                body: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        margin: const EdgeInsets.all(20),
                        height: 540,
                        width: 350,
                        child: PageView.builder(itemBuilder: (context, index) {
                          return Card(
                            color: Colors.blue.withOpacity(0.2),
                            child: Center(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(loadedState.quizes[index].title),
                            )),
                          );
                        }))
                  ],
                ));

          default:
            return SizedBox();
        }
      },
    );
  }
}
