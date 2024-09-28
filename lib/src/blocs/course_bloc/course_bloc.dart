import 'package:bloc_pattern_mvp/src/repositry/course_repositry.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'course_event.dart';
import 'course_state.dart';


class CourseBloc extends Bloc<CourseEvent, CourseState> {
  final CourseRepository repository;

  CourseBloc({required this.repository}) : super(CourseInitial()) {
    on<FetchCoursesEvent>(_onFetchCourses);
  }

  void _onFetchCourses(FetchCoursesEvent event, Emitter<CourseState> emit) async {
    emit(CourseLoading());
    try {
      final courses = await repository.fetchCourses();
      emit(CourseLoaded(courses));
    } catch (e) {
      emit(CourseError(e.toString()));
    }
  }
}
