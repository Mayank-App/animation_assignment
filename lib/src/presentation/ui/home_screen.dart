import 'package:flutter/material.dart';

import '../../utils/constants/appconstants.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppConstants.homeScreen),
      ),
      body: const Center(
        child: Text(AppConstants.hometxt),
      ),
    );
  }
}
