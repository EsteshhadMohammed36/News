import 'package:flutter/material.dart';

class ErrorIndicator extends StatelessWidget {
  String errorMsg;

  ErrorIndicator({required this.errorMsg, super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        errorMsg,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }
}
