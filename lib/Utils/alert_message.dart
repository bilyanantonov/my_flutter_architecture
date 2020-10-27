import 'package:flutter/material.dart';

class AlertMessage {
  static Future<void> alertMessage(BuildContext context, String uyari, String message) {
    return showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(uyari),
          content: Text(message),
          actions: <Widget>[
            FlatButton(
              child: Text('Tamam'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}