import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timer/screens/activity/bloc/activity_bloc.dart';
import 'package:timer/screens/savescreen.dart';

class ActivityView extends StatefulWidget {
  const ActivityView({Key? key}) : super(key: key);

  @override
  _ActivityViewState createState() => _ActivityViewState();
}

class _ActivityViewState extends State<ActivityView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Task-Timer"),
      ),
      body: BlocBuilder<ActivityBloc, ActivityState>(
        builder: (context, state) {
          if (state is ActivityLoadedState) {
            return ListView.builder(
              scrollDirection: Axis.vertical,
                itemCount: state.activites.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: EdgeInsets.all(20),
                      height: 300,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Text(state.activites[index].title,style: TextStyle(),),
                          Padding(padding: EdgeInsets.all(10)),
                          Text(state.activites[index].description,textAlign: TextAlign.left,),
                          CountDownTimer(secondsRemaining: state.activites[index].duration.inSeconds, whenTimeExpires:(){
                            print("hello");
                          })
                        ],
                      ),
                    ),
                  );
                });
          }
          return Container();
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SaveScreen()));
        },
      ),
    );
  }
}



class CountDownTimer extends StatefulWidget {
  const CountDownTimer({
    Key? key,
    required this.secondsRemaining,
    required this.whenTimeExpires,
    this.countDownFormatter,
    this.countDownTimerStyle,
  }) : super(key: key);

  final int secondsRemaining;
  final VoidCallback whenTimeExpires;
  final TextStyle? countDownTimerStyle;
  final Function(int seconds)? countDownFormatter;

  @override
  State createState() => _CountDownTimerState();
}

class _CountDownTimerState extends State<CountDownTimer>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final Duration duration;

  String get timerDisplayString {
    final duration = _controller.duration! * _controller.value;
    if (widget.countDownFormatter != null) {
      return widget.countDownFormatter!(duration.inSeconds) as String;
    } else {
      return formatHHMMSS(duration.inSeconds);
    }
  }

  String formatHHMMSS(int seconds) {
    final hours = (seconds / 3600).truncate();
    seconds = (seconds % 3600).truncate();
    final minutes = (seconds / 60).truncate();

    final hoursStr = (hours).toString().padLeft(2, '0');
    final minutesStr = (minutes).toString().padLeft(2, '0');
    final secondsStr = (seconds % 60).toString().padLeft(2, '0');

    if (hours == 0) {
      return '$minutesStr:$secondsStr';
    }

    return '$hoursStr:$minutesStr:$secondsStr';
  }

  @override
  void initState() {
    super.initState();
    duration = Duration(seconds: widget.secondsRemaining);
    _controller = AnimationController(
      vsync: this,
      duration: duration,
    );
    _controller
      ..reverse(from: widget.secondsRemaining.toDouble())
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed ||
            status == AnimationStatus.dismissed) {
          widget.whenTimeExpires();
        }
      });
  }



  @override
  void didUpdateWidget(CountDownTimer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.secondsRemaining != oldWidget.secondsRemaining) {
      setState(() {
        duration = Duration(seconds: widget.secondsRemaining);
        _controller.dispose();
        _controller = AnimationController(
          vsync: this,
          duration: duration,
        );
        _controller
          ..reverse(from: widget.secondsRemaining.toDouble())
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              widget.whenTimeExpires();
            }
          });
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          AnimatedBuilder(
            animation: _controller,
            builder: (_, Widget? child) {
              return Text(
                timerDisplayString,
                style: widget.countDownTimerStyle,
              );
            },
          ),
          TextButton(onPressed: (){
            _controller.stop();

          }, child: Text("Stop")),
          TextButton(onPressed: (){
            _controller.reverse();

          }, child: Text("Resume"))
        ],
      ),
    );
  }
}
