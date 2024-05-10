import 'package:flutter/material.dart';
import 'package:nail_art/Core/Constants/TextStyles.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: poppinsText(
                text: 'Opps something went wrong.',
                fontSize: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
