import 'package:cloud_firestore/cloud_firestore.dart';

class Quizz {
  String id;
  String title;
  String imageUrl;
  String description;
  int timeSeconds;
  int questionsCount;
  List<Questions>? questions;

  Quizz(
      {required this.id,
      required this.title,
      required this.imageUrl,
      required this.description,
      required this.timeSeconds,
      required this.questionsCount,
      this.questions});

  Quizz.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        imageUrl = json['image_url'],
        description = json['Description'],
        timeSeconds = json['time_seconds'],
        questions = (json['questions'] as List)
            .map((item) => Questions.fromJson(item))
            .toList(),
        questionsCount = 0;

  Quizz.fromSnapshot(QueryDocumentSnapshot<Map<String, dynamic>> json)
      : id = json.id,
        title = json['title'],
        imageUrl = json['image_url'],
        description = json['description'],
        timeSeconds = json['timeSeconds'],
        questions = [],
        questionsCount = json['questions_count'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['image_url'] = imageUrl;
    data['Description'] = description;
    data['time_seconds'] = timeSeconds;
    if (questions != null) {
      data['questions'] = questions!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  int generateMinutes() {
    return (timeSeconds / 60).round();
  }
}

class Questions {
  String id;
  String question;
  List<Answers> answers;
  String correctAnswer;

  Questions({
    required this.id,
    required this.question,
    required this.answers,
    required this.correctAnswer,
  });

  Questions.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        question = json['question'],
        answers = (json['answers'] as List)
            .map((item) => Answers.fromJson(item))
            .toList(),
        correctAnswer = json['correct_answer'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['question'] = question;
    data['answers'] = answers.map((v) => v.toJson()).toList();
    data['correct_answer'] = correctAnswer;
    return data;
  }
}

class Answers {
  String identifier;
  String answer;

  Answers({
    required this.identifier,
    required this.answer,
  });

  Answers.fromJson(Map<String, dynamic> json)
      : identifier = json['identifier'] as String,
        answer = json['Answer'] as String;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['identifier'] = identifier;
    data['Answer'] = answer;
    return data;
  }
}
