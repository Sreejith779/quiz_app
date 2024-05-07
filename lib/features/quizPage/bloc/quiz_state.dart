part of 'quiz_bloc.dart';

@immutable
abstract class QuizState {}
abstract class QuizActionState extends QuizState {}

final class QuizInitial extends QuizState {}
class QuizLoadedState extends QuizState{
  final List<QuizModel>quizes;

  QuizLoadedState({required this.quizes});
}


