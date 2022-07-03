import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../constants.dart';

class LoadingToast extends StatelessWidget {
  const LoadingToast({Key? key, required this.message}) : super(key: key);
  final String? message;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // The loading indicator
            LoadingAnimationWidget.staggeredDotsWave(
                color: kPrimaryColor, size: 50),
            const SizedBox(
              height: 15,
            ),
            // Some text
            Text(message!)
          ],
        ),
      ),
    );
  }
}
