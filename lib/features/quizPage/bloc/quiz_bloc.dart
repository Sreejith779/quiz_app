import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart'as http;

part 'quiz_event.dart';
part 'quiz_state.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  QuizBloc() : super(QuizInitial()) {
   on<QuizInitialEvent>(quizInitialEvent);
  }

  FutureOr<void> quizInitialEvent(QuizInitialEvent event, Emitter<QuizState> emit) async{

    var client = http.Client();
    try {
      var response = await client.get(
          Uri.parse('https://jsonplaceholder.typicode.com/todos'),

      );
      var decodedResponse = jsonDecode(response.body);
      print(decodedResponse);
    } finally {
      client.close();
    }
  }
}
