
import 'package:bloc_pattern_mvp/src/data/network_service.dart';

import '../models/course_model.dart';

class CourseRepository {
  final String apiUrl = 'https://iosacademy.io/api/v1/courses/index.php';
  final NetworkService networkService;

  CourseRepository({required this.networkService});

  Future<List<Course>> fetchCourses() async {
    final response = await networkService.get(apiUrl);
    return (response as List).map((course) => Course.fromJson(course)).toList();
  }
}

