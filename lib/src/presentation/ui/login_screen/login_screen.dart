import 'package:flutter/material.dart';

import '../../../config/colors.dart';
import '../../../utils/constants/appconstants.dart';
import '../../../utils/utils.dart';
import '../home_screen.dart';
import 'customWidget/congrats_dialog.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text(AppConstants.loginPageTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: emailController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  labelText: AppConstants.emailLabel,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return AppConstants.enterEmailMessage;
                  } else if (!Apputils.isValidEmail(value)) {
                    return AppConstants.invalidEmailMessage;
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: passwordController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: AppConstants.passwordLabel,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return AppConstants.enterPasswordMessage;
                  } else if (!Apputils.isValidPassword(value)) {
                    return AppConstants.invalidPasswordMessage;
                  }
                  return null;
                },
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: 350,
                height: 50,
                child: ElevatedButton(
                  child:const Text(
                    AppConstants.loginButtonText,
                    style: TextStyle(color:  AppColor.buttonColr, fontSize: 25),
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (BuildContext context) {
                        return const LoginProgressDialog();
                      },
                    );
                    Future.delayed(const Duration(seconds: 3), () {
                      Navigator.of(context).pop();
                      Navigator.pushReplacement(context, MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ),
                      );
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
