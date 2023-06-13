class QAModel {
  String answer;
  String question;
  String dateTime;

  QAModel(this.answer, this.question, this.dateTime);

  QAModel.fromJason(Map<String, dynamic> json)
      : answer = json['AnswerText'],
        dateTime = json['date'],
        question = json['QuestionText'];
}
