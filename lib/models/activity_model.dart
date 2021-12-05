import 'package:equatable/equatable.dart';

class ActivityModel extends Equatable {
  final String title;
  final String description;
  final Duration duration;

  ActivityModel(this.title, this.description, this.duration);
  @override
  List<Object?> get props => [title, description,duration];
}
