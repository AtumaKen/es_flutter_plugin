import 'package:es_flutter_plugin/src/utilities/package_strings.dart';
import 'package:flutter/material.dart';

class LoadingAnimation extends StatefulWidget {
  @override
  _LoadingAnimationState createState() => _LoadingAnimationState();
}

class _LoadingAnimationState extends State<LoadingAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
        lowerBound: 0.0,
        upperBound: 100,
        vsync: this,
        duration: Duration(seconds: 1));
    _animationController.addListener(() {
      setState((){});
    });
    _animationController.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      margin: EdgeInsets.only(top: _animationController.value),
      child: Center(
        child: Image(
          image: AssetImage(
            "assets/images/easyswitch_icon.png",
            package: Strings.packageName,
          ),
          height: 40,
          width: 40,
        ),
      ),
    );
  }
}
