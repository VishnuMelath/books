import 'package:books/features/home_screen/bloc/home_screen_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RetryDialog extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;

  const RetryDialog({
    super.key,
    required this.message,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'Alert!',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      content: Text(
        message,
        style: const TextStyle(fontSize: 14),
      ),
      actions: [
        // TextButton(
        //   onPressed: () => Navigator.of(context).pop(),
        //   child: const Text(
        //     'NO',
        //     style: TextStyle(
        //       color: Colors.grey,
        //       fontWeight: FontWeight.w500,
        //     ),
        //   ),
        // ),
        TextButton(
          onPressed: () {
            onRetry();
            Navigator.of(context).pop();
          },
          child: const Text(
            'Retry',
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}

showRetryConfirmation(BuildContext context, String message) {
  showDialog(
    context: context,
    builder: (context) => RetryDialog(
      message: message,
      onRetry: () {
        context.read<HomeScreenBloc>().add(HomeScreenBooksLoadingEvent());
      },
    ),
  );
}
