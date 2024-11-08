import 'package:flutter/material.dart';

class CustomSnackbar extends StatelessWidget {
  final String message;
  final bool green;
  const CustomSnackbar({super.key, required this.message, this.green = true});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Material(
          borderRadius: BorderRadius.circular(8.0),
          elevation: 6.0,
          child: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            decoration: BoxDecoration(
              color: green ? Colors.green.shade600 : Colors.red.shade600,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  green ? Icons.check_circle_outline : Icons.error,
                  color: Colors.white,
                  size: 24.0,
                ),
                const SizedBox(width: 8.0),
                Flexible(
                  child: Text(
                    message,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void showCustomSnackbar(BuildContext context, String message,
    [bool green = true]) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: CustomSnackbar(message: message, green: green),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      elevation: 0,
    ),
  );
}
