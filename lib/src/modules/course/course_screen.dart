import 'package:bloc_pattern_mvp/src/blocs/course_bloc/course_bloc.dart';
import 'package:bloc_pattern_mvp/src/blocs/course_bloc/course_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoursePage extends StatelessWidget {
  const CoursePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Courses'),
      ),
      body: BlocBuilder<CourseBloc, CourseState>(
        builder: (context, state) {
          if (state is CourseInitial) {
            return Center(child: Text('Welcome!'));
          } else if (state is CourseLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is CourseLoaded) {
            return ListView.builder(
              itemCount: state.courses.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(state.courses[index].name),
                  leading:Container(
                     width: 100,
                          height: 50,
                    child: FadeInImage(
                      placeholder: AssetImage('assets/placeholder.png'), // Placeholder image
                      image: NetworkImage(state.courses[index].imageUrl),
                      fit: BoxFit.cover,
                      placeholderErrorBuilder: (context, error, stackTrace) {
                        return Container(
                          width: 100,
                          height: 50,
                          color: Colors.grey,
                        );
                      },
                      imageErrorBuilder: (context, error, stackTrace) {
                        return Icon(Icons.error);
                      },
                    ),
                  ),
                );
              },
            );
          } else if (state is CourseError) {
            return Center(child: Text(state.message));
          } else {
            return Container();
          }
        },
      ),
    );
  }
}