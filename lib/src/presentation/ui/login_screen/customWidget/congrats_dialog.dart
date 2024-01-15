
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import '../../../../utils/constants/appconstants.dart';

class LoginProgressDialog extends StatelessWidget {
  const LoginProgressDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AlertDialog(
      content: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            height: 200,
            child: RiveAnimation.asset(
              AppConstants.riveanimation,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 15,
            child: Text(
            AppConstants.congrts,
              style: TextStyle(fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }
}
