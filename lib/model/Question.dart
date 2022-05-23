class Question {
  String? title = "";
  bool? questionAnswer = false;

  Question({String? title, bool? answer}) {
    // ignore: prefer_initializing_formals
    this.title = title;
    questionAnswer = answer;
  }
}
