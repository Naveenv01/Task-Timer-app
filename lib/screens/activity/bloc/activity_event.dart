part of 'activity_bloc.dart';

abstract class ActivityEvent extends Equatable {
  const ActivityEvent();

  @override
  List<Object> get props => [];
}

class AddActivityEvent extends ActivityEvent {
  final String title;
  final String description;

  AddActivityEvent(this.title, this.description);
}
