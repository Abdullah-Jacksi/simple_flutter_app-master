import 'package:flutter/material.dart';


class UiUtils{
  static showLoading(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: new Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  new Text("Loading..."),
                  new SizedBox(
                    height: 10,
                  ),
                  new CircularProgressIndicator(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}