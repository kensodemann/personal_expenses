import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const AdaptiveElevatedButton(
      {Key? key, required this.onPressed, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            color: Theme.of(context).primaryColor,
            onPressed: onPressed,
            child: Text(text),
          )
        : ElevatedButton(
            onPressed: onPressed,
            child: Text(text),
          );
  }
}
