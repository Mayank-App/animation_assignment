import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:annimation_assignment/src/presentation/ui/home_screen.dart';
import 'package:annimation_assignment/src/utils/constants/appconstants.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class AnnimationScreen extends StatefulWidget {

  const AnnimationScreen({super.key});

  @override

  State<AnnimationScreen> createState() => _AnnimationScreenState();

}

class _AnnimationScreenState extends State<AnnimationScreen> with SingleTickerProviderStateMixin {

  late AnimationController _dialogController;

  late Future<void> _delayedFuture;

  @override

  void initState()
  {

    super.initState();

    _dialogController = AnimationController(

      vsync: this,

      duration: const Duration(seconds: 1),

    );

    _dialogController.forward();

    _delayedFuture = Future.delayed(const Duration(seconds: 2), () {});

    Future.delayed(const Duration(seconds: 7),(){

      Navigator.push(context, MaterialPageRoute(builder: (context)=>const HomeScreen()));

    });
  }

  @override

  void dispose() {

    _dialogController.dispose();

    super.dispose();

  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            slideContainer(),
            textAnimated(),
          ],
        ),
      ),
    );
  }

  Widget slideContainer() {

    return SlideTransition(

      position: Tween<Offset>(

        begin: const Offset(0, 0),

        end: const Offset(0, -0.75),

      ).animate(
        CurvedAnimation(
          parent: _dialogController,
          curve: Curves.easeInOut,
        ),
      ),
      child: const SizedBox(
        height: 200,
        width: 200,
        child: RiveAnimation.asset(
          AppConstants.riveanimation,
        ),
      ),
    );
  }

  Widget textAnimated() {
    return FutureBuilder(
      future: _delayedFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done)
        {
          return AnimatedTextKit(
            animatedTexts: [
              WavyAnimatedText(
                "Congratulation",
                textStyle: const TextStyle(
                  color: Colors.red,
                  fontSize: 28,
                ),
              ),
            ],
          );
        }
        else
        {
          return Container(
            height: 40,
          );
        }
      },
    );
  }
}