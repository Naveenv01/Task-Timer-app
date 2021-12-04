import 'package:equatable/equatable.dart';

class ActivityModel extends Equatable {
  final String title;
  final String desciption;

  ActivityModel(this.title, this.desciption);
  @override
  List<Object?> get props => [title, desciption];
}
