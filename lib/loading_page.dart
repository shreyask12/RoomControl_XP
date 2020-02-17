import 'package:flutter/material.dart';

class LoadingScreen extends StatefulWidget {
  final Duration duration;
  final String pagenavigate;

  const LoadingScreen({this.duration,this.pagenavigate});

  @override
  _LoadingScreenState createState() => new _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> with SingleTickerProviderStateMixin {
  AnimationController animationController;

  @override
  void initState() {
    animationController = new AnimationController(duration: widget.duration, vsync: this)
      ..forward()
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          Navigator.pushReplacementNamed(context, widget.pagenavigate);
        }
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new AnimatedBuilder(
      animation: animationController,
      builder: (context, _) {
        return new Center(
          child: new Text(animationController.lastElapsedDuration.inSeconds.toString()),
        );
      },
    );
  }
}