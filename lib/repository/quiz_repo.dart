import 'dart:convert';

import 'package:quiz_app/models/quizModel.dart';
import 'package:http/http.dart' as http;

class QuizRepo {
  static Future<List<QuizModel>> fetchQuiz() async {
    var client = http.Client();
    List<QuizModel> quizs = [];

    try {
      var response = await client.get(
        Uri.parse('https://opentdb.com/api.php?amount=10'),
      );

      if (response.statusCode <= 400) {
        Map<String, dynamic> decodedResponse = jsonDecode(response.body);
        if (decodedResponse.containsKey('results')) {
          List<dynamic> quizList = decodedResponse['results'];
          for (int i = 0; i < quizList.length; i++) {
            QuizModel quiz = QuizModel.fromJson(quizList[i]);
            quizs.add(quiz);
          }
        }
      } else {
        throw Exception('Failed to load quiz');
      }

      return quizs;
    } catch (e) {
      print('Error: $e');
      return [];
    }
  }
}
