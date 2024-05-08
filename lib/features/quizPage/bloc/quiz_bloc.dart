import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart'as http;
import 'package:quiz_app/models/quizModel.dart';
import 'package:quiz_app/repository/quiz_repo.dart';

part 'quiz_event.dart';
part 'quiz_state.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  QuizBloc() : super(QuizInitial()) {
   on<QuizInitialEvent>(quizInitialEvent);
  }

  FutureOr<void> quizInitialEvent(QuizInitialEvent event, Emitter<QuizState> emit) async{

    // var client = http.Client();
    // List<QuizModel>quizs = [];
    // try {
    //   var response = await client.get(
    //       Uri.parse('https://jsonplaceholder.typicode.com/todos'),
    //
    //   );
    //   List decodedResponse = jsonDecode(response.body);
    //   for(int i = 0; i<decodedResponse.length;i++){
    //     QuizModel quiz = QuizModel.fromJson(decodedResponse[i] as Map<String,dynamic>);
    //     quizs.add(quiz);
    //   }
    //   emit(QuizLoadedState(quizes:quizs));
    //   print(quizs);
    // }   catch(e){
    //   print(e.toString());
    // }
    List<QuizModel>Quiz= await QuizRepo.fetchQuiz();
    print(Quiz);
    emit(QuizLoadedState(quizes: Quiz));

  }
}
