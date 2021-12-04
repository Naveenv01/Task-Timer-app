import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:timer/models/activity_model.dart';

part 'activity_event.dart';
part 'activity_state.dart';

class ActivityBloc extends Bloc<ActivityEvent, ActivityState> {
  ActivityBloc() : super(ActivityInitial()) {
    on<AddActivityEvent>(onAddActivityEvent);
  }

  List<ActivityModel> activity = [];

  FutureOr<void> onAddActivityEvent(
      AddActivityEvent event, Emitter<ActivityState> emit) {
    activity.add(ActivityModel(event.title, event.description));
    emit(ActivityInitial());
    emit(ActivityLoadedState(activity));
  }

  @override
  void onChange(Change<ActivityState> change) {
    print(change);
    super.onChange(change);
  }
}
