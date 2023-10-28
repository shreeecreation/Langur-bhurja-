import 'package:flutter/material.dart';

import '../../../../core/themes/theme.dart';

class QuestionMarkDialogBox {
  QuestionMarkDialogBox._();

  static void showDialogs(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('What is Win Mode ? ', style: AppStyles.text18Px),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                'Win Mode is a gameplay feature where the user rolls one of the six dice in a sequence repeats approximately three to four times every four rolls.\nThe sequence is Bhurja, Langur, Pan, Ita, Surat, Chiri. \nThe Win feature is specially added for the player who is betting. \n\nHappy Game !',
                style: AppStyles.text13Px,
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
