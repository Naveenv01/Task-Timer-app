part of 'activity_bloc.dart';

abstract class ActivityState extends Equatable {
  const ActivityState();

  @override
  List<Object> get props => [];
}

class ActivityInitial extends ActivityState {}

class ActivityLoadedState extends ActivityState {
  final List<ActivityModel> activites;

  ActivityLoadedState(this.activites);

  @override
  List<Object> get props => [activites, activites.length];
}
