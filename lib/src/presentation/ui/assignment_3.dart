import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Assignment3 extends StatefulWidget{
  @override
  State<Assignment3> createState() => _Assignment3State();
}

class _Assignment3State extends State<Assignment3> with SingleTickerProviderStateMixin{
  late Animation<double> animation;
  late AnimationController controller;
  void initState() {
    super.initState();
    controller = AnimationController(duration: const Duration(seconds: 2), vsync: this);
    animation = Tween<double>(begin: 0, end: 300).animate(controller);
    // #enddocregion print-state
    //   ..addListener(() {
    //     setState(() {}); // Add this line
    //   })
    //   ..addStatusListener((status) {
    //     if (status == AnimationStatus.completed) {
    //       controller.reverse();
    //     } else if (status == AnimationStatus.dismissed) {
    //       controller.forward();
    //     }
    //   })
    // #docregion print-state
    // ..addStatusListener((status) => print('$status'));
    controller.forward();

  }

  @override
  Widget build(BuildContext context) {
    return  AnimatedLogo(animation: animation, controller: controller);
  }
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
class AnimatedLogo extends AnimatedWidget {
  const AnimatedLogo({
    Key? key,
    required Animation<double> animation,
    required this.controller,
  }) : super(key: key, listenable: animation);

  final AnimationController controller;

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            height: animation.value,
            width: animation.value,
            child: const FlutterLogo(),
          ),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            if (animation.status == AnimationStatus.completed) {
              controller.reverse();
            }
          },
          onLongPress: () {
            if (animation.status == AnimationStatus.dismissed) {
              controller.forward();
            }
          },
          child: const Text('Press Here'),
        ),
      ],
    );
  }
}