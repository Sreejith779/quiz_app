class QuizModel {
  int userId;
  int id;
  String title;
  bool completed;

  QuizModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  factory QuizModel.fromJson(Map<String, dynamic> json) => QuizModel(
    userId: json["userId"],
    id: json["id"],
    title: json["title"],
    completed: json["completed"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "id": id,
    "title": title,
    "completed": completed,
  };
}
