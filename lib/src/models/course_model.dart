// course_model.dart
class Course {
  final String name;
  final String imageUrl;

  Course({required this.name, required this.imageUrl});

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      name: json['name'],
      imageUrl: json['image'],
    );
  }
}
