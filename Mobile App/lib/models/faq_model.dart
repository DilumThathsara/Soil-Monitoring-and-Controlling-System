class FAQModel {
  String answer;
  String question;

  FAQModel(this.answer, this.question);

  FAQModel.fromJason(Map<String, dynamic> json)
      : answer = json['Answer'],
        question = json['Question'];
}
