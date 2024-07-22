class SleepQuality {
  final int score;
  final String monthAcronym;

  SleepQuality({required this.score, required this.monthAcronym});

  factory SleepQuality.fromJson(Map<String, dynamic> json) {
    return SleepQuality(
      score: json['score'],
      monthAcronym: json['monthAcronym'],
    );
  }
}
