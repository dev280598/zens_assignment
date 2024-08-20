class JokeModel {
  final String content;
  final bool? isVoted;
  final String id;

  JokeModel({
    required this.content,
    this.isVoted,
    required this.id,
  });

  factory JokeModel.fromJson(Map<String, dynamic> json) {
    return JokeModel(
      content: json['content'] ?? '',
      id: json['id'] ?? '',
      isVoted: json['isVoted'],
    );
  }
}
