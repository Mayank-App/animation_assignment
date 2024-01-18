import 'package:annimation_assignment/src/presentation/ui/annimation_page.dart';
import 'package:flutter/material.dart';
import '../../../utils/constants/colors.dart';
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

                   Navigator.push(context, MaterialPageRoute(builder: (context)=>AnnimationScreen()));
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
// import 'package:annimation_assignment/src/presentation/ui/home_screen.dart';
// import 'package:annimation_assignment/src/utils/constants/appconstants.dart';
// import 'package:flutter/material.dart';
// import 'package:animated_text_kit/animated_text_kit.dart';
// import 'package:rive/rive.dart';
//
// import '../../../utils/utils.dart';
//
//
// class LoginPage extends StatefulWidget {
//   const LoginPage({Key? key}) : super(key: key);
//
//
//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }
//
//
// class _LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin {
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   String? _emailError;
//   String? _passwordError;
//   late AnimationController _dialogController;
//
//
//   @override
//   void initState() {
//     super.initState();
//     _dialogController = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 1),
//     );
//   }
//   @override
//   void dispose() {
//     _dialogController.dispose();
//     super.dispose();
//   }
//   void _showCongratulationsDialog(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     showDialog(
//       context: context,
//       builder: (context) {
//         return Dialog(
//           child: SizedBox(
//             height: size.height * 0.3,
//             width: size.width * 0.8,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 SlideTransition(
//                   position: Tween<Offset>(
//                     begin: Offset(0, 0),
//                     end: Offset(0, -1),
//                   ).animate(
//                     CurvedAnimation(
//                       parent: _dialogController,
//                       curve: Curves.easeInOut,
//                     ),
//                   ),
//                   child: SizedBox(
//                     height: size.height * 0.3,
//                     width: size.width * 0.8,
//                     child: const RiveAnimation.asset(
//                       AppConstants.riveanimation,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
//
//
//   void _showCongratulationsText(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//
//
//     Future.delayed(Duration.zero, () {
//       _dialogController.reset();
//       _dialogController.forward();
//     });
//
//
//     showDialog(
//       context: context,
//       builder: (context) {
//         return Dialog(
//           child: SizedBox(
//             height: size.height * 0.3,
//             width: size.width * 0.8,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 SlideTransition(
//                   position: Tween<Offset>(
//                     begin: Offset(0, 1),
//                     end: Offset(0, 0),
//                   ).animate(
//                     CurvedAnimation(
//                       parent: _dialogController,
//                       curve: Curves.easeInOut,
//                     ),
//                   ),
//                   child: AnimatedTextKit(
//                     animatedTexts: [
//                       WavyAnimatedText(
//                         AppString.congText,
//                         textStyle: const TextStyle(
//                           color: Colors.purple,
//                           fontSize: 30,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(AppString.loginPageTitle),
//         backgroundColor: AppColor.appBarColor,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             TextFormField(
//               controller: _emailController,
//               autovalidateMode: AutovalidateMode.onUserInteraction,
//               decoration: InputDecoration(
//                 labelText: AppConstants.emailLabel,
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(50.0),
//                 ),
//               ),
//               validator: (value) {
//                 if (value == null || value.isEmpty) {
//                   return AppConstants.enterEmailMessage;
//                 } else if (!Apputils.isValidEmail(value)) {
//                   return AppConstants.invalidEmailMessage;
//                 }
//                 return null;
//               },
//             ),
//             const SizedBox(height: 16.0),
//             TextFormField(
//               controller: _passwordController,
//               autovalidateMode: AutovalidateMode.onUserInteraction,
//               obscureText: true,
//               decoration: InputDecoration(
//                 labelText: AppConstants.passwordLabel,
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(50.0),
//                 ),
//               ),
//               validator: (value) {
//                 if (value == null || value.isEmpty) {
//                   return AppConstants.enterPasswordMessage;
//                 } else if (!Apputils.isValidPassword(value)) {
//                   return AppConstants.invalidPasswordMessage;
//                 }
//                 return null;
//               },
//             ),
//             const SizedBox(height: 24.0),
//            ElevatedButton(
//               onPressed: () {
//                 setState(() {
//                   _emailError = null;
//                   _passwordError = null;
//                 });
//                 // Validate email and password
//                 if (!_validateInputs()) {
//                   // Show error messages below the respective text fields
//                   setState(() {
//                     _emailError = Apputils.isValidEmail(_emailController.text)
//                         ? null
//                         : AppConstants.emailError;
//                     _passwordError = Apputils.isValidPassword(_passwordController.text)
//                         ? null
//                         : AppConstants.passwordError;
//                   });
//                 } else {
//                   Future.delayed(const Duration(seconds: 1), () {
//                     // Show dialog with Rive animation
//                     _showCongratulationsDialog(context);
//                     // After 2 seconds, show congratulations text
//                     Future.delayed(const Duration(seconds: 2), () {
//                       _showCongratulationsText(context);
//                       // After 3 seconds, navigate to another page
//                       Future.delayed(const Duration(seconds: 3), () {
//                         Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
//                       });
//                     });
//                   });
//                 }
//               },
//               child: Text(AppConstants.enterPasswordMessage),
//             ),
//             const SizedBox(height: 50),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.pushNamed(context, RoutesConstraints.swipablePage);
//               },
//               child: Text("Next page"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//
//   bool _validateInputs() {
//     bool isValid = true;
//
//
//     if (_emailController.text.isEmpty) {
//       setState(() {
//         _emailError = AppString.emailError2;
//       });
//       isValid = false;
//     } else if (!Validation.isValidEmail(_emailController.text)) {
//       setState(() {
//         _emailError = AppString.emailError;
//       });
//       isValid = false;
//     }
//
//
//     if (_passwordController.text.isEmpty) {
//       setState(() {
//         _passwordError = AppString.passwordError2;
//       });
//       isValid = false;
//     } else if (!Validation.isValidPassword(_passwordController.text)) {
//       setState(() {
//         _passwordError = AppString.passwordError;
//       });
//       isValid = false;
//     }
//     return isValid;
//   }
// }




