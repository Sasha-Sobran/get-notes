class Note {
  final String title;
  final String description;
  final int id;

  Note({
    required this.title,
    required this.description,
    required this.id,
  });

  factory Note.fromJson(Map<String, dynamic> json) {
    return Note(
      title: json['title'],
      description: json['description'],
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'id': id,
    };
  }
}
