class QuizModel {
  String type;
  String difficulty;
  String category;
  String question;
  String correctAnswer;
  List<String> incorrectAnswers;

  QuizModel({
    required this.type,
    required this.difficulty,
    required this.category,
    required this.question,
    required this.correctAnswer,
    required this.incorrectAnswers,
  });

  factory QuizModel.fromJson(Map<String, dynamic> json) => QuizModel(
    type: json["type"],
    difficulty: json["difficulty"],
    category: json["category"],
    question: json["question"],
    correctAnswer: json["correct_answer"],
    incorrectAnswers: List<String>.from(json["incorrect_answers"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "difficulty": difficulty,
    "category": category,
    "question": question,
    "correct_answer": correctAnswer,
    "incorrect_answers": List<dynamic>.from(incorrectAnswers.map((x) => x)),
  };
}